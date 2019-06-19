//
//  Defines.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Dlog function
func DLog(message: Any, function: String = #function) { // use this function only to print
    #if DEBUG
    print("\(function): \(message)")
    #endif
}

let decoder = JSONDecoder()


//MARK:- Message Strings
struct Messages {  // define constant message here only
    static let noInternetMsg = "No internet connection. Please turn on mobile data or WiFi and retry."
    static let somethingWentWrongMsg = "Sorry, unable to connect to our servers. Please try again later."
    static let noName = "Please enter your name"
    static let noQualification = "Please enter your qualification details"
    static let firstName = "Please enter your first name"
    static let lastName = "Please enter your last name"
    static let noEmail = "Please enter your email address"
    static let noCompanyName = "Please enter company name"
    static let noDesignation = "Please enter designation"
    static let noPassword = "Please enter password"
    static let invalidEmail = "Please enter valid email address"
    static let errorMatchPassword = "The passwords you entered do not match"
    static let oldPassword = "Please enter old password"
    static let newPassword = "Please enter new password"
    static let confirmPassword = "Please confirm your password"
    static let newConfirmPassword = "New and confirm password should be same"
    static let minMaxPassord = "Password length should be minimum of 6 and maximum of 20 characters"
    static let counrty = "Please select your country"
    static let phoneNumber = "Please enter your mobile number"
    static let validPhoneNumber = "Please enter valid mobile number"
    static let noMailConfigure = "Your phone is not configured for mail. Please configured mail settings and then try"
    static let downloadStarted = "Downloading ..."
    static let addedToCalendar = "Added to calendar"
    static let removedFromCalendar = "Removed from calendar"
    static let failedToadd = "Failed to add in calendar"
    static let failedToremove = "Failed to remove from calendar"
    
    static let paitentName = "Please enter patient name."
    static let procedure = "Please select procedure."
    static let appointmentDate = "Please select preferred date."
    static let emptyOTP = "Please enter OTP"
    static let selectProcedure = "You can select only two procedure at a time"
}

struct EmptyScreenMessage {
    static let noData = "No Data Available"
    static let noNet = "No Internet Connection"
    static let noNetSubheader = "Check Your Network"
    static let error = "Sorry, unable to connect to our servers. Please retry later."
}

//MARK:- Device
struct Device {
    let SCREEN_BOUND = UIScreen.main.bounds
    static let IS_IPAD             = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPHONE           = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_RETINA           = UIScreen.main.scale >= 2.0
    
    static let SCREEN_WIDTH        = Int(UIScreen.main.bounds.size.width)
    static let SCREEN_HEIGHT       = Int(UIScreen.main.bounds.size.height)
    static let SCREEN_MAX_LENGTH   = Int( max(SCREEN_WIDTH, SCREEN_HEIGHT) )
    static let SCREEN_MIN_LENGTH   = Int( min(SCREEN_WIDTH, SCREEN_HEIGHT) )
    static let SCREEN_BOUND        = UIScreen.main.bounds
    
    static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH  <= 568
    static let IS_IPHONE_5         = IS_IPHONE && SCREEN_MAX_LENGTH == 568
    static let IS_IPHONE_6         = IS_IPHONE && SCREEN_MAX_LENGTH == 667
    static let IS_IPHONE_6P        = IS_IPHONE && SCREEN_MAX_LENGTH == 736
    static let IS_IPHONE_6P_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH <= 736
    static let IS_IPHONE_X         = IS_IPHONE && SCREEN_MAX_LENGTH == 812
    static let IS_IPAD_9           = IS_IPAD && SCREEN_MAX_LENGTH == 1024
    static let IS_IPHONE_XR         = IS_IPHONE && SCREEN_MAX_LENGTH == 896
    static let IS_IPHONE_8         = IS_IPHONE && SCREEN_MAX_LENGTH > 568  && SCREEN_MAX_LENGTH <= 667
}
