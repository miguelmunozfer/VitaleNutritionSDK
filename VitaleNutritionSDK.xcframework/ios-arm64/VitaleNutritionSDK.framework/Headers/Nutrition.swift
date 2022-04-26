//
//  Vitale.swift
//  Vitale
//
//  Created by Miguel on 02/07/2020.
//  Copyright © 2020 Vitale. All rights reserved.
//

import Foundation
import UIKit

public class NutritionSDK{
    
    public static let sharedInstance = NutritionSDK()
    private var app_id: String!
    private var password: String!
    
    public func start(with user: String, appID: String, password: String){
        self.app_id = appID
        self.password = password
        NutritionAuth.sharedInstance.start(with: user, appID: appID, password: password)
    }
    
    public func setPremiumText(_ text: String){
        NutritionSDKUtils.sharedInstance.setPremiumMessage(text)
    }
    
    public func isPremiumUser(_ isPremium: Bool){
        NutritionSDKUtils.sharedInstance.setUserPremium(isPremium)
    }
    
    public func preferLargeTitlte(_ preferLarge: Bool){
        NutritionSDKUtils.sharedInstance.prefersLargeTitles(preferLarge)
    }
    
    public func startSession(appID: String, password: String){
        self.app_id = appID
        self.password = password
        NutritionAuth.sharedInstance.start(with: nil, appID: appID, password: password)
    }
    
    public func logout(){
        NutritionAuth.sharedInstance.logout()
    }
    
    public func setMainColor(color: String){
        NutritionSDKUtils.sharedInstance.setPrimaryColor(color: color)
    }
    
    public func updateProfile(user: String, sex: String?, height: Int?, weigth: Int?, birthDate: Date?, metabolismoBasal: Double, consumoKcal: Double, ingestas: Int, grupoMenu: Int, _ completion: @escaping((Bool)->())){
        NutritionAuth.sharedInstance.updateCurrentUser(user: user, sex: sex, height: height, weigth: weigth, birthDate: birthDate, metabolismoBasal: metabolismoBasal, consumoKcal: consumoKcal, ingestas: ingestas, grupoMenu: grupoMenu){ isSuccess in
            completion(isSuccess)
        }
    }
    
    public func showNutritionModule(){
        NutritionControllers.sharedInstance.getNutrition { (viewController) in
            if let topViewController = UIApplication.shared.keyWindow?.rootViewController{
                viewController?.modalPresentationStyle = .fullScreen
                topViewController.present(viewController!, animated: true, completion: nil)
            }
        }
    }
    
    public func showTodayIntake(_ intakeNumber: Int){
        NutritionControllers.sharedInstance.showTodayIntake(intakeNumber)
    }
    
    public func getTodayMenu(_ completion: @escaping((NutritionDay?)->())){
        NutritionUtils.sharedInstance.getTodayMenu { menuDay in
            completion(menuDay)
        }
    }
    
    public func getTodayMenu()->NutritionDay?{
        return NutritionUtils.sharedInstance.getTodayMenu()
    }
    
    public func getNutritionModule(_ completion: @escaping((UIViewController?)->())){
        NutritionControllers.sharedInstance.getNutrition { (viewController) in
            completion(viewController)
        }
    }
    
    public func getNumberOfIntakes(_ completion: @escaping((Int)->())){
        NutritionAuth.sharedInstance.getNumberOfIntakes { intakes in
            completion(intakes)
        }
    }
    
}
