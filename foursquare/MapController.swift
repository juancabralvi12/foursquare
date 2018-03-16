//
//  ViewController.swift
//  foursquare
//
//  Created by Juan Cabral on 12/02/18.
//  Copyright © 2018 Juan Cabral. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {

    var camera : GMSCameraPosition?
    var mapView : GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logout()
        
        //Themes 4,5
        
        var user = User(name: "Juan Cabral", image: "penguin.png")
        var post = Post(text: "Swift ", imageUrl: "post_image.png", user: user)
        
        post.incrementComments()
        post.incrementComments()
        post.incrementLikes()
        post.incrementLikes()
        
        print("comments: \(post.getComments()); likes: \(post.getLikes());")
        print("tuple: \(post.getCounters()); \(post.getDisplayTimeAgo(date:  Date(timeIntervalSinceNow: -60*60*24*7*4)))")
        print("userId: \(post.user?.id)")
        
        //Themes 6,7
        
        var point = Point<String>(x: 1, y:2, value: "Juan")
        var list : [Point<String>] = [Point<String>(x:2.0, y:3.0), Point<String>(x:2.0, y:4.0)]
        
        
        Point<String>(x:2.0, y:4.0, value: "String")
        
        print(point[2.0,3.0])
        
        
        do {
            let finalList = try getPoints(list: list, point: point, radius: 1)
            //for list print in the google map using the gm api
            print(finalList)
        } catch {
            print(error)
        }
        
        view.backgroundColor = UIColor.blue
        GMSServices.provideAPIKey("your_key_here")
        
        //20.7321983,-103.3736167,16.05
        camera = GMSCameraPosition.camera(withLatitude: 20.7321983, longitude: -103.3736167, zoom: 14.05)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera!)
        mapView?.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 20.735026, longitude: -103.370962)
        marker.title = "Tec Milenio"
        marker.snippet = "Mexico"
        marker.map = mapView
        
        //20.731995,-103.38216,
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 20.731995, longitude: -103.38216)
        marker2.title = "Auditorio Telmex"
        marker2.snippet = "Mexico"
        marker2.map = mapView
        
    }
    
    
    func getPoints(list: [Point<String>], point: Point<String>, radius: Double) throws -> [Point<String>]{
        var finalList = [Point<String>]()
        for item in list {
            let finalItem = point[item.x!, item.y!] < radius ? item : nil
            if let appendValue = finalItem {
                finalList.append(appendValue)
            }
        }
        return finalList
    }
    
    func logout(){
       var loginController: LoginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}

