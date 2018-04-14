//
//  ViewController.swift
//  PSI
//
//  Created by Muchamad Chozinul Amri on 14/4/18.
//  Copyright © 2018 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    var psi:Psi?
    let regionRadius: CLLocationDistance = 29000
    let singaporeCenter = CLLocation(latitude: 1.3521, longitude: 103.8198)
    var annotationList = [MKPointAnnotation]()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentDisplayType: UISegmentedControl!
    
    @IBOutlet weak var lblNationalInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        PSIApi.GetPSI(completion: {
            [unowned self] (psi) in
            self.psi = psi
            self.refreshMap()
        });
        
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //init map
    func initUI() {
        centerMapOnLocation(location: singaporeCenter)
        mapView.delegate = self
    }

    //center map
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    //refresh map
    func refreshMap(){
        
        guard let psi = psi,
        let regionMetadata = psi.regionMetadata else {
            return
        }
        
        let choice = segmentDisplayType.selectedSegmentIndex
        
        var reading:Reading?
        
        if choice == 0 {
            reading = psi.items?[0].readings?.psi_twenty_four_hourly
        }else {
            reading = psi.items?[0].readings?.pm25_twenty_four_hourly
        }
        
        mapView.removeAnnotations(annotationList)
        
        for region in regionMetadata {
            if region.name == "national" {
                if let title = segmentDisplayType.titleForSegment(at: choice),
                    let readingStr = reading?.national,
                    let timestamp = psi.items?[0].getUpdateTimestampString(),
                    let status = psi.apiInfo?.status{
                    lblNationalInfo.text = "\(title): \(readingStr) @ \(timestamp)\nStatus: \(status)"
                }
            }else if region.name == "central" {
                addAnnotation(reading: reading?.central, region: region)
            }else if region.name == "north" {
                addAnnotation(reading: reading?.north, region: region)
            }else if region.name == "south" {
                addAnnotation(reading: reading?.south, region: region)
            }else if region.name == "west" {
                addAnnotation(reading: reading?.west, region: region)
            }else if region.name == "east" {
                addAnnotation(reading: reading?.east, region: region)
            }
        }
        
    }
    
    
    func addAnnotation(reading:Int?, region:Region?) {
        guard let name = region?.name,
            let location = region?.labelLocation?.getCLLocation(),
        let reading = reading else {
            return
        }
        let point = MKPointAnnotation()
        point.title = "\(reading)"
        point.subtitle = name
        point.coordinate = location
        mapView.addAnnotation(point)
        annotationList.append(point)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = AnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = false
            annotationView?.image = UIImage(named: "annotation_background")
        }
        else {
            annotationView!.annotation = annotation
        }
        
        if let annotationV = annotationView as! AnnotationView? {
            annotationV.showTitle(title: annotation.title!!)
            annotationV.showSubtitle(title: annotation.subtitle!!)
        }
        
        
        return annotationView
        
    }
    
    //actions
    @IBAction func segmentDisplayTypeValueChanged(_ sender: Any) {
        refreshMap()
    }
    
}

