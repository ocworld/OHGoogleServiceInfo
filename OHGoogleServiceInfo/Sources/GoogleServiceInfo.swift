//
//  GoogleServiceInfo.swift
//  OHGoogleServiceInfo
//
//  Created by Keunhyun Oh on 2018. 7. 3..
//  Copyright © 2018년 Keunhyun Oh. All rights reserved.
//

import Foundation

public struct GoogleServiceInfo: Codable {
    public var AD_UNIT_ID_FOR_BANNER_TEST: String
    public var AD_UNIT_ID_FOR_INTERSTITIAL_TEST: String
    public var CLIENT_ID: String
    public var REVERSED_CLIENT_ID: String
    public var API_KEY: String
    public var GCM_SENDER_ID: String
    public var PLIST_VERSION: String
    public var BUNDLE_ID: String
    public var PROJECT_ID: String
    public var STORAGE_BUCKET: String
    public var IS_ADS_ENABLED: Bool
    public var IS_ANALYTICS_ENABLED: Bool
    public var IS_APPINVITE_ENABLED: Bool
    public var IS_GCM_ENABLED: Bool
    public var IS_SIGNIN_ENABLED: Bool
    public var GOOGLE_APP_ID: String
    public var DATABASE_URL: String
    
    public init(AD_UNIT_ID_FOR_BANNER_TEST: String,
                AD_UNIT_ID_FOR_INTERSTITIAL_TEST: String,
                CLIENT_ID: String,
                REVERSED_CLIENT_ID: String,
                API_KEY: String,
                GCM_SENDER_ID: String,
                PLIST_VERSION: String,
                BUNDLE_ID: String,
                PROJECT_ID: String,
                STORAGE_BUCKET: String,
                IS_ADS_ENABLED: Bool,
                IS_ANALYTICS_ENABLED: Bool,
                IS_APPINVITE_ENABLED: Bool,
                IS_GCM_ENABLED: Bool,
                IS_SIGNIN_ENABLED: Bool,
                GOOGLE_APP_ID: String,
                DATABASE_URL: String) {
        
        self.AD_UNIT_ID_FOR_BANNER_TEST = AD_UNIT_ID_FOR_BANNER_TEST
        self.AD_UNIT_ID_FOR_INTERSTITIAL_TEST = AD_UNIT_ID_FOR_INTERSTITIAL_TEST
        self.CLIENT_ID = CLIENT_ID
        self.REVERSED_CLIENT_ID = REVERSED_CLIENT_ID
        self.API_KEY = API_KEY
        self.GCM_SENDER_ID = GCM_SENDER_ID
        self.PLIST_VERSION = PLIST_VERSION
        self.BUNDLE_ID = BUNDLE_ID
        self.PROJECT_ID = PROJECT_ID
        self.STORAGE_BUCKET = STORAGE_BUCKET
        self.IS_ADS_ENABLED = IS_ADS_ENABLED
        self.IS_ANALYTICS_ENABLED = IS_ANALYTICS_ENABLED
        self.IS_APPINVITE_ENABLED = IS_APPINVITE_ENABLED
        self.IS_GCM_ENABLED = IS_GCM_ENABLED
        self.IS_SIGNIN_ENABLED = IS_SIGNIN_ENABLED
        self.GOOGLE_APP_ID = GOOGLE_APP_ID
        self.DATABASE_URL = DATABASE_URL
        
    }
    
    public init?(plistUrl: URL) {
        
        guard let data = try? Data(contentsOf: plistUrl) else {
            return nil
        }
        
        let decoder = PropertyListDecoder()
        guard let info = try? decoder.decode(GoogleServiceInfo.self, from: data) else {
            return nil
        }
        
        self = info
        
    }
    
    public init?(plistPath: String) {
        self.init(plistUrl: URL(fileURLWithPath: plistPath))
    }
    
}
