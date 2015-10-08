//
//  ZeTarget.h
//  
//
//  Created by Zemoso on 20/01/15.
//  Copyright (c) 2015 Zemoso. All rights reserved.
//

#import <Foundation/Foundation.h>


/*!
 * @brief The Zinteract Class is the interface that developer can use to include the zinteract API's features.
 */
@interface ZeTarget : NSObject

// To access the properties
+(NSDictionary *)variablesDictionary;
+(void)setVariablesDictionary:(NSDictionary *)variablesDictionary;

/*!
 * @discussion This method will log an event.
 * @param eventName A String which represents the name of the event
 */
+(void)logEventWithName:(NSString *)eventName;

/*!
 * @discussion This method will register the device token for push notifications.
 * @param token A String which represents the token of the device.
 */
+(void)registerPushToken:(NSString *)token;

/*!
 * @discussion This method will log an event.
 * @param eventName A String which represents the name of the event
 * @param eventVariables A Dictionary containing the additional variables to be sent along with the event.
 */
+(void)logEventWithName:(NSString *)eventName andEventParams: (NSDictionary *)eventVariables;


/*!
 * @discussion This method will log completion of a purchase/ revenue generating event.
 * @param grandTotal The final billing amount after the other charges such as shipping and tax are applied
 */
+(void)logPurchaseWithGrandTotal:(NSNumber *) grandTotal;

/*!
 * @discussion This method will log completion of a purchase/ revenue generating event.
 * @param quantity Quantity of the items purchased
 * @param grandTotal The final billing amount after the other charges such as shipping and tax are applied
 */
+(void)logPurchaseWithQuantity:(NSNumber *)quantity GrandTotal:(NSNumber *) grandTotal;



/*!
 * @discussion This method will log completion of a purchase/ revenue generating event.
 * @param quantity Quantity of the items purchased
 * @param grandTotal The final billing amount after the other charges such as shipping and tax are applied
 * @param currency The currency in which the transaction is done - Use the ISO 4217 currency names such as USD, INR, GBP
 */
+(void)logPurchaseWithQuantity:(NSNumber *)quantity GrandTotal:(NSNumber *) grandTotal Currency:(NSString *)currency;

/*!
 * @discussion This method will log completion of a purchase/ revenue generating event.
 * @param grandTotal The final billing amount after the other charges such as shipping and tax are applied
 * @param total The total amount before other charges such as shipping and tax applied
 * @param shipping The Shipping charges for the product
 * @param tax The tax to be imposed on the final bill
 */
+(void)logPurchaseWithGrandTotal:(NSNumber *) grandTotal Total:(NSNumber *)total Shipping:(NSNumber *)shipping Tax:(NSNumber *)tax;


/*!
 * @discussion This method will log completion of a purchase/ revenue generating event.
 * @param quantity Quantity of the items purchased
 * @param grandTotal The final billing amount after the other charges such as shipping and tax are applied
 * @param total The total amount before other charges such as shipping and tax applied
 * @param productSKU The Product's stock keeping unit
 * @param shipping The Shipping charges for the product
 * @param tax The tax to be imposed on the final bill
 */
+(void)logPurchaseWithQuantity:(NSNumber *)quantity GrandTotal:(NSNumber *) grandTotal Total:(NSNumber *)total ProductSKU:(NSString *)productSKU Shipping:(NSNumber *)shipping Tax:(NSNumber *)tax;

/*!
 * @discussion This method will log completion of a purchase/ revenue generating event.
 * @param quantity Quantity of the items purchased
 * @param grandTotal The final billing amount after the other charges such as shipping and tax are applied
 * @param total The total amount before other charges such as shipping and tax applied
 * @param productSKU The Product's stock keeping unit
 * @param currency The currency in which the transaction is done - Use the ISO 4217 currency names such as USD, INR, GBP
 * @param shipping The Shipping charges for the product
 * @param tax The tax to be imposed on the final bill
 */
+(void)logPurchaseWithQuantity:(NSNumber *)quantity GrandTotal:(NSNumber *) grandTotal Total:(NSNumber *)total ProductSKU:(NSString *)productSKU Shipping:(NSNumber *)shipping Tax:(NSNumber *)tax Currency:(NSString *)currency;


/*!
 * @discussion This method will log completion of a purchase/ revenue generating event.
 * @param orderId A String which represents the id of the order placed
 * @param quantity Quantity of the items purchased
 * @param grandTotal The final billing amount after the other charges such as shipping and tax are applied
 * @param total The total amount before other charges such as shipping and tax applied
 * @param productSKU The Product's stock keeping unit
 * @param currency The currency in which the transaction is done - Use the ISO 4217 currency names such as USD, INR, GBP
 * @param shipping The Shipping charges for the product
 * @param tax The tax to be imposed on the final bill
 * @param receiptId The receipt id provided for the purchase
 */
+(void)logPurchaseWithOrderId:(NSString *)orderId Quantity:(NSNumber *)quantity GrandTotal:(NSNumber *) grandTotal Total:(NSNumber *)total ProductSKU:(NSString *)productSKU Currency:(NSString *)currency Shipping:(NSNumber *)shipping Tax:(NSNumber *)tax ReceiptId:(NSString *)receiptId;


/*!
 * @discussion This method will log completion of a purchase/ revenue generating event.
 * @param orderId A String which represents the id of the order placed
 * @param quantity Quantity of the items purchased
 * @param price Price of a single item
 * @param grandTotal The final billing amount after the other charges such as shipping and tax are applied
 * @param productSKU The Product's stock keeping unit
 * @param currency The currency in which the transaction is done - Use the ISO 4217 currency names such as USD, INR, GBP
 * @param shipping The Shipping charges for the product
 * @param tax The tax to be imposed on the final bill
 * @param receiptID The receipt data provided for the in-app purchases
 */

//UNCOMMENT THIS METHOD WHEN THE RECEIPT DATA OPTION WILL BE ENABLED

//+(void)logPurchaseWithOrderId:(NSString *)orderId Quantity:(NSNumber *)quantity Price:(NSNumber *)price GrandTotal:(NSNumber *) grandTotal ProductSKU:(NSString *)productSKU Currency:(NSString *)currency Shipping:(NSNumber *)shipping Tax:(NSNumber *)tax ReceiptId:(NSData *)receiptID;

/*!
 * @discussion This method will log purchase attempt.
 */
+(void)logPurchaseAttempted;

/*!
 * @discussion This method will register for remote push notification.
 * @param arrayOfCategories An array of UIMutableUserNotificationCategory objects.
 */
+(void)registerForPushNotificationsWithcategory:(NSArray *)arrayOfCategories;

/*!
 * @discussion This method will register for remote push notification.
 */
+(void)registerForPushNotifications;


/*!
 * @discussion This method will instantiate the API using the sdk key.
 * @param key The license key. It will be unique for each app.
 */
+(void)instantiateAPIWithKey:(NSString* )key;

/*!
 * @discussion This method will instantiate the API using the sdk key.
 * @param key The license key. It will be unique for each app.
 * @param userId Id of user manually uploaded.
 */
+(void)instantiateAPIWithKey:(NSString* )key UserId:(NSString*)userId;

/*!
 * @discussion This method will instantiate the API using the sdk key.
 * @param key The license key. It will be unique for each app.
 */
+(void)instantiateAPIInDebugModeWithKey:(NSString* )key;

/*!
 * @discussion This method will instantiate the API using the sdk key.
 * @param key The license key. It will be unique for each app.
 * @param userId Id of user manually uploaded.
 */
+(void)instantiateAPIInDebugModeWithKey:(NSString* )key UserId:(NSString*)userId;


/*!
 * @discussion This method will set the properties of the user using the application.
 * @param userProperties A dictionary containing the user properties.
 */
+(void)setUserProperties:(NSDictionary *)userProperties;

/*!
 * @discussion This method will communicate to the sdk the screen which is being displayed to the user.
 * @param screenId This parameter is an object of the ViewController being displayed.
 */
+(void)setCurrentScreen:(id)screenId;

/*!
 * @discussion This method will indicate that the user using the application has changed.
 * @param newUserID The userID of the the new user being logged in.
 * If the newUserId field is set as nil, Zinteract will assign a default userId to the user, depending on the device.
 */
+(void)changeUserIdTo:(NSString *)newUserID;

/*!
 * @discussion Call this method in handlePushNotificationActionWithIdentifier method in appdelegate.
 * @param identifier The Action identifier.
 * @param userInfo information about user and notification details.
 */

+(void)handlePushNotificationActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo;
/*!
 * @discussion Call this method to send rate later button clicked event to sdk.
 */
+(void)rateLaterButtonClicked;
/*!
 * @discussion Call this method to get user properties from sdk.
 */
+(NSDictionary*)getPropertiesDict;
/*!
 * @discussion Call this method in application:didBecomeActive method in appDelegate.
 */
+(void)appEnteredForeground;
/*!
 * @discussion Call this method to log push campaign Views.
 * @param userInfo PushNotification payload.

 */
+(void)logPushCampaignViewed:(NSDictionary*)userInfo;

/*!
 * @discussion Call this method to set user's first Name.
  * @param firstName user's first name.
  */
+(void)setUserFirstName:(NSString*)firstName;

/*!
 * @discussion Call this method to set user's last name.
* @param lastName user's last name.
 */
+(void)setUserLastName:(NSString*)lastName;

/*!
 * @discussion Call this method to set user's age.
  * @param age user's age.
 */
+(void)setUserAge:(NSString*)age;

/*!
 * @discussion Call this method to set user's gender.
 * @param gender user's gender
 */
+(void)setUserGender:(NSString*)gender;

/*!
 * @discussion Call this method to set user's date fo birth.
 * @param dob user's date of birth in "mm-dd-yyyy" format
 */
+(void)setUserDateOfBirth:(NSString*)dob;
/*!
 * @discussion Call this method to set url to target.
 * @param urlString url that sdk will target
 */
+(void)setZetargetUrl:(NSString*)urlString;

@end
