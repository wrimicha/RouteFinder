//
//  MapView.swift
//  Assignment3
//
//  Created by Michael Wright on 2021-11-13.
//

import MapKit
import SwiftUI


var userPin : CLLocationCoordinate2D?

//create struct for the pin
struct Location: Identifiable{
    let id = UUID()
    let name : String
    let coordinate : CLLocationCoordinate2D
}

struct RouteSteps : Identifiable {
    let id = UUID()
    let step : String
}

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    
    @State var locationOne : String = ""
    @State var locationTwo : String = ""
    @State var locationThree : String = ""

    
    @State var currentStep = 0


    @State var annotations = [
        Location(name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664))
    ]
    
    @State private var regionOne = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var regionTwo = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var regionThree = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    
    @State private var locOne = CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)
    @State private var locTwo = CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)
    @State private var locThree = CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)
    
    
    @State var routeStartToFirst : [RouteSteps] = [RouteSteps(step: "Enter Destinations:")]
    @State var routeFirstToSecond : [RouteSteps] = [RouteSteps(step: "Enter Destinations:")]
    @State var routeSecondToThird : [RouteSteps] = [RouteSteps(step: "Enter Destinations:")]
    @State var routeStartToDestination : [RouteSteps] = [RouteSteps(step: "Enter Destinations:")]

    @State var routeToShow = 0
    
    let purple = Color(red: 0.47, green: 0.38, blue: 1.03)
    let darkPurple = Color(red: 0.21, green: 0.16, blue: 0.59)
    let grey = Color(red: 1.00, green: 1.00, blue: 1.00)
    
    var body: some View {
        VStack{
            switch routeToShow {
              case 0:
                ZStack{
                    Button(action:{
                        currentStep = (currentStep == 0) ? (routeStartToFirst.count - 1) : (currentStep - 1)
                    }){
                        ZStack{
                            Text("<")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 50, alignment: .leading)
                    Button(action:{
                        currentStep = (currentStep + 1)
                        
                    }){
                        ZStack{
                            Text(">")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 50, alignment: .trailing)
                    Text(routeStartToFirst[currentStep % routeStartToFirst.count].step)
                        .font(.system(size: 15, weight: .medium))
                        .frame(width: UIScreen.main.bounds.size.width - 100, height: 50)
                }
                .frame(width: UIScreen.main.bounds.size.width - 20, height: 60)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 3, y: 1)
                
              case 1:
                ZStack{
                    Button(action:{
                        currentStep = (currentStep == 0) ? (routeFirstToSecond.count - 1) : (currentStep - 1)
                    }){
                        ZStack{
                            Text("<")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 50, alignment: .leading)
                    Button(action:{
                        currentStep = (currentStep + 1)
                        
                    }){
                        ZStack{
                            Text(">")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 50, alignment: .trailing)
                    Text(routeFirstToSecond[currentStep % routeFirstToSecond.count].step)
                        .font(.system(size: 15, weight: .medium))
                        .frame(width: UIScreen.main.bounds.size.width - 100, height: 50)

                }
                .frame(width: UIScreen.main.bounds.size.width - 20, height: 60)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 3, y: 1)
            case 2:
                ZStack{
                    Button(action:{
                        currentStep = (currentStep == 0) ? (routeStartToDestination.count - 1) : (currentStep - 1)
                    }){
                        ZStack{
                            Text("<")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 50, alignment: .leading)
                    Button(action:{
                        currentStep = (currentStep + 1)
                        
                    }){
                        ZStack{
                            Text(">")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 50, alignment: .trailing)
                    Text(routeStartToDestination[currentStep % routeStartToDestination.count].step)
                        .font(.system(size: 15, weight: .medium))
                        .frame(width: UIScreen.main.bounds.size.width - 100, height: 50)
                }
                .frame(width: UIScreen.main.bounds.size.width - 20, height: 60)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 3, y: 1)
            default:
                ZStack{
                    Button(action:{
                        currentStep = (currentStep == 0) ? (routeStartToFirst.count - 1) : (currentStep - 1)
                    }){
                        ZStack{
                            Text("<")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 50, alignment: .leading)
                    Button(action:{
                        currentStep = (currentStep + 1)
                        
                    }){
                        ZStack{
                            Text(">")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width - 50, height: 50, alignment: .trailing)
                    Text(routeStartToFirst[currentStep % routeStartToFirst.count].step)
                        .font(.system(size: 15, weight: .medium))
                        .frame(width: UIScreen.main.bounds.size.width - 100, height: 50)
                }
                .frame(width: UIScreen.main.bounds.size.width - 20, height: 60)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 3, y: 1)
            }
            
        
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: annotations){ item in
                MapPin(coordinate: item.coordinate)
            }
            .accentColor(purple)
            .cornerRadius(35)

            .onAppear {
                viewModel.checkIfLocationServicesEnabled()
            }
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 3)
            .ignoresSafeArea(.all)

            
            ScrollView {
                    
                HStack{
                    Button(action:{
                        routeToShow = 0
                        currentStep = 0
                    }){
                        let current = routeToShow == 0 ? darkPurple : purple
                        ZStack{
                            Rectangle()
                                .fill(current)
                                .frame(width: (UIScreen.main.bounds.size.width / 3) - 20, height: 50)
                                .padding(5)
                                .cornerRadius(100)
                                .shadow(radius: 3, y: 1)
                            Text("Stop 1")
                                .foregroundColor(Color.white)
                        }
                    }
                    Button(action:{
                        routeToShow = 1
                        currentStep = 0

                    }){
                        let current = routeToShow == 1 ? darkPurple : purple
                        ZStack{
                            Rectangle()
                                .fill(current)
                                .frame(width: (UIScreen.main.bounds.size.width / 3) - 20, height: 50)
                                .padding(5)
                                .cornerRadius(30)
                                .shadow(radius: 3, y: 1)
                            Text("Stop 2")
                                .foregroundColor(Color.white)
                        }
                    }
                    Button(action:{
                        routeToShow = 2
                        currentStep = 0
                    }){
                        let current = routeToShow == 2 ? darkPurple : purple
                        ZStack{
                            Rectangle()
                                .fill(current)
                                .frame(width: (UIScreen.main.bounds.size.width / 3) - 20, height: 50)
                                .padding(5)
                                .cornerRadius(30)
                                .shadow(radius: 3, y: 1)
                            Text("Destination")
                                .foregroundColor(Color.white)
                        }
                    }
                }
                
                
                VStack{
                    HStack{
                        TextField("Enter Stop 1", text: $locationOne)
                            .textFieldStyle(TextInputStyle())
                        Button(action:{
                            findNewLocation(tbLocEntered: locationOne)
                        }){
                            Text("Add Pin")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: 50)
                    .padding(10)
                    HStack{
                        TextField("Enter Stop 2", text: $locationTwo)
                            .textFieldStyle(TextInputStyle())
                        Button(action:{
                            findNewLocation(tbLocEntered: locationTwo)
                        }){
                            Text("Add Pin")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: 50)
                    .padding(6)
                    HStack{
                        TextField("Enter Destination", text: $locationThree)
                            .textFieldStyle(TextInputStyle())
                        Button(action:{
                            findNewLocation(tbLocEntered: locationThree)
                        }){
                            Text("Add Pin")
                                .foregroundColor(purple)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: 50)
                    .padding(6)
                    
                    Button(action:{
                        annotations = []
                    }){
                            Text("Clear Pins")
                                .foregroundColor(purple)
                    }
                    .padding(2)
                    Button(action:{
                        getDirections(stopOne: locationOne, stopTwo: locationTwo, stopThree: locationThree) //, stopThree: locationThree
                    }){
                        ZStack{
                            Rectangle()
                                .fill(purple)
                                .frame(width: UIScreen.main.bounds.size.width - 30, height: 60)
                                .cornerRadius(20)
                                .shadow(radius: 3, y: 1)
                            Text("Get Directions")
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))


                    switch routeToShow {
                        case 0:

                            List(routeStartToFirst) { r in
                                Text(r.step)
                            }
                        
                        case 1:
                        
                            List(routeFirstToSecond) { r in
                                Text(r.step)
                            }
      
                        case 2:
                            List(routeStartToDestination) { r in
                                Text(r.step)
                            }
                        default:
                            List(routeFirstToSecond) { r in
                                Text(r.step)
                            }
                        }
                    
                    }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 2, alignment: .top)
                .padding(10)
                .ignoresSafeArea(.all)
            }
        }
    }
    
    
    func findNewLocation(tbLocEntered: String){
        let locEnteredText = tbLocEntered

        let geocoder = CLGeocoder()

        //make a request for the location based on the entered text
        //wait until the results finish and process those results inside the completion handler
        geocoder.geocodeAddressString(locEnteredText, completionHandler:
        {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error at geocode")
            }

            //if first placemark != nil:
            if let placemark = placemarks?.first {

                //set coordinates = to the first placemark coordinates
                let coordinates : CLLocationCoordinate2D = placemark.location!.coordinate

                //set the selected region and the zoom level
                //region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

                //add a pin for the location
                annotations.append(Location(name: placemark.name!, coordinate: coordinates))
            }
        })
    }
    
    
    
    func getDirections(stopOne: String, stopTwo: String, stopThree: String){

        let geocoder = CLGeocoder()

        //get first coordinate:
        geocoder.geocodeAddressString(stopOne, completionHandler:
        {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error at geocode")
            }

            if let placemark = placemarks?.first {
                locOne = placemark.location!.coordinate

                //set the selected region and the zoom level
                //regionOne = MKCoordinateRegion(center: locOne, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
            
            //get second coordinate:
            geocoder.geocodeAddressString(stopTwo, completionHandler:
            {(placemarks, error) -> Void in
                if((error) != nil){
                    print("Error at geocode")
                }

                if let placemark = placemarks?.first {
                    locTwo = placemark.location!.coordinate

                    //set the selected region and the zoom level
                    //regionTwo = MKCoordinateRegion(center: locTwo, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                }
                
                
                //get thrid coordinate:
                geocoder.geocodeAddressString(stopThree, completionHandler:
                {(placemarks, error) -> Void in
                    if((error) != nil){
                        print("Error at geocode")
                    }

                    if let placemark = placemarks?.first {
                        locThree = placemark.location!.coordinate

                        //set the selected region and the zoom level
                        //regionThree = MKCoordinateRegion(center: locThree, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                    }
                    
                    
                    //get directions for the start point to stop 1
                    let startToFirstStop = MKDirections.Request()
                    startToFirstStop.source = MKMapItem(placemark: MKPlacemark(coordinate: viewModel.region.center, addressDictionary: nil))
                    startToFirstStop.destination = MKMapItem(placemark: MKPlacemark(coordinate: self.locOne, addressDictionary: nil))
                    startToFirstStop.requestsAlternateRoutes = false
                    startToFirstStop.transportType = .automobile
                    
                    
                    //create variable for directions
                    let startToFirst = MKDirections(request: startToFirstStop)
                    
                    //calculate the directions and return a response object with the directions
                    startToFirst.calculate(completionHandler: {response, error in

                        for route in (response?.routes)!{

                            self.routeStartToFirst = []

                            //iterate through the response object and add the directions to the routeSteps array
                            for step in route.steps{
                                self.routeStartToFirst.append(RouteSteps(step: step.instructions))
                            }
                            
                            routeStartToFirst = Array(routeStartToFirst[1...(routeStartToFirst.count-1)])
                            
                        }
                        
                        //get directions for the first point to second
                        let firstToSecondStop = MKDirections.Request()
                        firstToSecondStop.source = MKMapItem(placemark: MKPlacemark(coordinate: self.locOne, addressDictionary: nil))
                        firstToSecondStop.destination = MKMapItem(placemark: MKPlacemark(coordinate: self.locTwo, addressDictionary: nil))
                        firstToSecondStop.requestsAlternateRoutes = false
                        firstToSecondStop.transportType = .automobile
                        
                        let firstToSecond = MKDirections(request: firstToSecondStop)
                        
                        //calculate the directions and return a response object with the directions
                        firstToSecond.calculate(completionHandler: {response, error in

                            for route in (response?.routes)!{

                                self.routeFirstToSecond = []

                                //iterate through the response object and add the directions to the routeSteps array
                                for step in route.steps{
                                    self.routeFirstToSecond.append(RouteSteps(step: step.instructions))
                                }
                                
                                routeFirstToSecond = Array(routeFirstToSecond[1...(routeFirstToSecond.count-1)])
                                
                            }
                            
                            //get directions for the first point to second
                            let secondToThirdStop = MKDirections.Request()
                            secondToThirdStop.source = MKMapItem(placemark: MKPlacemark(coordinate: self.locTwo, addressDictionary: nil))
                            secondToThirdStop.destination = MKMapItem(placemark: MKPlacemark(coordinate: self.locThree, addressDictionary: nil))
                            secondToThirdStop.requestsAlternateRoutes = false
                            secondToThirdStop.transportType = .automobile
                            
                            let secondToThird = MKDirections(request: secondToThirdStop)
                            
                            //calculate the directions and return a response object with the directions
                            secondToThird.calculate(completionHandler: {response, error in

                                for route in (response?.routes)!{

                                    self.routeSecondToThird = []

                                    //iterate through the response object and add the directions to the routeSteps array
                                    for step in route.steps{
                                        self.routeSecondToThird.append(RouteSteps(step: step.instructions))
                                    }
                                    
                                    routeSecondToThird = Array(routeSecondToThird[1...(routeSecondToThird.count-1)])
                                    
                                }
                            
                                //get the total route instructions
                                
                                self.routeStartToDestination = []
                                routeStartToDestination = routeStartToFirst + routeFirstToSecond + routeSecondToThird
                                
//                                print(routeStartToFirst[1].step)
                                                                
                            //6th completion
                            })
                        //5th completion
                        })
                    //4th completion
                    })
                //3rd completion
                })
                
            //2nd completion
            })
        //1st completion
        })
    }


struct TextInputStyle: TextFieldStyle {
  let purpleBlue = Color(red: 0.51, green: 0.25, blue: 0.94)

  func _body(configuration: TextField<_Label>) -> some View {
    configuration
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .frame(width: UIScreen.main.bounds.size.width - 100)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3, y: 1)
        //.padding(6)
        //.accentColor(Color.green)
        //.foregroundColor(Color.green)
        //.font(.system(size: 15, weight: .medium, design: .monospaced))
        .disableAutocorrection(true)
  }
}

}
