//
//  TwitterClient.swift
//  Huella_Deportiva
//
//  Created by Javier Bustillo on 4/3/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit
import BDBOAuth1Manager



class TwitterClient: BDBOAuth1SessionManager {
   
    
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "xAb5OfjH51OPjLKqmrVhQaObG", consumerSecret: "m2G1Ub91Vvr3mKAdR2Dtxz0s3PJMrOpqEIVE6lRRU40LdvwZXS")

    
    
}
