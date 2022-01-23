//
//  ContentViewModel.swift
//  Assignment3
//
//  Created by Michael Wright on 2021-11-10.
//

import MapKit

enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 40.7891, longitude: -73.1350)
    static let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    //update UI whenever the region changes
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.span)
    
    var locationManager : CLLocationManager?
    
    
    func checkIfLocationServicesEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        } else {
            print("User location is not enabled! Turn it on in settings!!")
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        //check whether or not we have access to the user location
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted, .denied:
                print("Access to locataion is currently restricted or denied")
            case .authorizedAlways, .authorizedWhenInUse:
            
            if locationManager.location != nil{
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.span)
            }
            
            //region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.span)
            //region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.span)
            
            print(region)
            
            @unknown default:
                break
            }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        checkLocationAuthorization()
    }
}
