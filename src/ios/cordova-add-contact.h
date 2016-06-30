/********* cordova-add-contact.h Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface CordovaAddContact : CDVPlugin <CNContactViewControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic , strong) CNContactViewController *addContactVC;
@property (strong, nonatomic) UINavigationController *navController;
@property (nonatomic, strong) UIBarButtonItem *backBarButton;

- (void)coolMethod:(CDVInvokedUrlCommand*)command;

@end
