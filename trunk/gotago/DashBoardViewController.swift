//
//  DashBoardViewController.swift
//  Carousel
//
//  Created by Saurabh Chakraborty on 20/07/16.
//  Copyright © 2016 Intelegencia. All rights reserved.
//

import UIKit
import MapKit

protocol MenuActionDelegate {
    func openSegue(_ SegueName: String, sender: AnyObject?)
}

protocol HandleMapSearch: class {
    func dropPinZoomIn(_ placemark:MKPlacemark)
}

class DashBoardViewController: UIViewController {

    //@IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nearMeCollectionView: UICollectionView!
    @IBOutlet weak var locationCollectionView: UICollectionView!
    
    @IBOutlet weak var currentUserProfileImageButton: UIButton!
    @IBOutlet weak var currentUserFullNameButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView : UIView!
    
    var selectedPin: MKPlacemark?
    var resultSearchController: UISearchController!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    fileprivate var interests = Interest.createInterests()
    fileprivate var locations = Locations.createLocations()
    
    var window: UIWindow?
    
    var viewShowingMapView = true
    
    let searchController = UISearchController(searchResultsController: nil)
    
    //let dataSource = DataSource()
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func viewDidLayoutSubviews()
    {
        let scrollViewBounds = scrollView.bounds
        let contentViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsets.zero
        scrollViewInsets.top = scrollViewBounds.size.height;
        scrollViewInsets.top -= contentViewBounds.size.height;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height
        scrollViewInsets.bottom = contentViewBounds.size.height/2.0 + 60.0;
        scrollViewInsets.bottom += 1
        
        scrollView.contentInset = scrollViewInsets
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "GotaGo"
        
        let rightButton: UIBarButtonItem = UIBarButtonItem(title: "Map", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.flipBetweenViews))
        self.navigationItem.rightBarButtonItem = rightButton
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController.searchResultsUpdater = locationSearchTable
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController.hidesNavigationBarDuringPresentation = false
        resultSearchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
        
        
        nearMeCollectionView.dataSource = self
        nearMeCollectionView.delegate = self
//        self.setNavigationBarItem()
        //self.prepareUI()

    }
    
    
    
    func flipBetweenViews() {
        if viewShowingMapView {
            //            [UIView .transitionFromView(self.map, toView: self.listView, duration: 0.6, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)]
            [UIView .transition(from: self.mapView, to: self.contentView, duration: 0.6, options: UIViewAnimationOptions.showHideTransitionViews, completion: nil)]
            viewShowingMapView = false
            self.contentView.isHidden = false
            
        } else {
            [UIView .transition(from: self.contentView, to: self.mapView, duration: 0.6, options: UIViewAnimationOptions.showHideTransitionViews, completion: nil)]
            self.contentView.isHidden = true
            viewShowingMapView = true
        }
    }
    
    func getDirections(){
        guard let selectedPin = selectedPin else { return }
        let mapItem = MKMapItem(placemark: selectedPin)
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMaps(launchOptions: launchOptions)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let indexPath = getIndexPathForSelectedCell() {
            highlightCell(indexPath, flag: false)
        }
    }
    
    // MARK:- prepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // retrieve selected cell
        let detailViewController = segue.destination as! DetailViewController
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    // MARK:- Should Perform Segue
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return !isEditing
    }
    
    // MARK:- Selected Cell IndexPath
    
    func getIndexPathForSelectedCell() -> IndexPath? {
        
        var indexPath:IndexPath?
        
        if nearMeCollectionView.indexPathsForSelectedItems!.count > 0 {
            indexPath = nearMeCollectionView.indexPathsForSelectedItems![0]
        }
        return indexPath
    }
    
    // MARK:- Highlight
    
    func highlightCell(_ indexPath : IndexPath, flag: Bool) {
        
        let cell = nearMeCollectionView.cellForItem(at: indexPath)
        
        if flag {
            cell?.contentView.backgroundColor = UIColor.magenta
        } else {
            cell?.contentView.backgroundColor = nil
        }
    }
    
    fileprivate struct Storyboard {
        static let CellIdentifier = "Interest Cell"
        static let LocationIdentifier = "Location Cell"
    }
    
    // MARK: prepareVC
    func prepareUI(){
        self.addSearchBar()

    }
    
    func addSearchBar(){

            searchController.searchResultsUpdater = self
            searchController.searchBar.delegate = self
            searchController.searchBar.searchBarStyle       = UISearchBarStyle.minimal
            searchController.searchBar.backgroundColor      = UIColor.white
            searchController.searchBar.tintColor            = UIColor.black
            searchController.searchBar.delegate             = self;
            searchController.searchBar.placeholder          = "Search";
        
        if !searchController.searchBar.isDescendant(of: self.view){
            self.view .addSubview(searchController.searchBar)
        }
    }
    
}

extension DashBoardViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == nearMeCollectionView {
            return interests.count
        } else {
            return locations.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == nearMeCollectionView  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! InterestCollectionViewCell
            
//            let fruits: [Fruit] = dataSource.fruitsInGroup(indexPath.section)
//            let fruit = fruits[indexPath.row]
            
//            print("", fruit)
            
            cell.interest = self.interests[(indexPath as NSIndexPath).item]
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.LocationIdentifier, for: indexPath) as! LocationsCollectionViewCell
            
            cell.location = self.locations[(indexPath as NSIndexPath).item]
            
            return cell
        }
    }
}

// MARK:- UICollectionViewDelegate Methods

extension DashBoardViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        highlightCell(indexPath, flag: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        highlightCell(indexPath, flag: false)
    }
}

extension DashBoardViewController: UICollectionViewDelegateFlowLayout {
    // MARK:- UICollectioViewDelegateFlowLayout methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        // http://stackoverflow.com/questions/28872001/uicollectionview-cell-spacing-based-on-device-sceen-size
        
        let length = (UIScreen.main.bounds.width-15)/2
        return CGSize(width: length,height: length);
    }
}

extension DashBoardViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension DashBoardViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
//        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension DashBoardViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}


extension DashBoardViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
    
}

extension DashBoardViewController: HandleMapSearch {
    
    func dropPinZoomIn(_ placemark: MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
    }
    
}

extension DashBoardViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        guard !(annotation is MKUserLocation) else { return nil }
        
        let reuseId = "pin"
        guard let pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView else { return nil }
        
        pinView.pinTintColor = UIColor.orange
        pinView.canShowCallout = true
        let smallSquare = CGSize(width: 30, height: 30)
        let button = UIButton(frame: CGRect(origin: CGPoint.zero, size: smallSquare))
        button.setBackgroundImage(UIImage(named: "car"), for: UIControlState())
        button.addTarget(self, action: #selector(DashBoardViewController.getDirections), for: .touchUpInside)
        pinView.leftCalloutAccessoryView = button
        
        return pinView
    }
}
