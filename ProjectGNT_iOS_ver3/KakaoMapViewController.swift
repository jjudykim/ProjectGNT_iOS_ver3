//
//  KakaoMapViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/15.
//

import UIKit

public let DEFAULT_POSITION = MTMapPointGeo(latitude: 37.576568, longitude: 127.029148)

class KakaoMapViewController: UIViewController, MTMapViewDelegate{
    
    var mapView: MTMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView = MTMapView(frame: self.view.bounds)
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            
            // 지도 중심점, 레벨
            mapView.setMapCenter(MTMapPoint(geoCoord: DEFAULT_POSITION), zoomLevel: 4, animated: true)
            
            // 현재 위치 트래킹
            mapView.showCurrentLocationMarker = true
            mapView.currentLocationTrackingMode = .onWithoutHeading
            
            self.view.addSubview(mapView)
        }
    }
    
}
