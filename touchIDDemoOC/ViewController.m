//
//  ViewController.m
//  touchIDDemoOC
//
//  Created by Zsombor on 2021. 01. 31..
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *guiLabel;

@end

@implementation ViewController
- (IBAction)loginButtonPressed:(id)sender {
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    NSString *reason = @"Please authenticate using TouchID.";

    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
       [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
           localizedReason:reason
               reply:^(BOOL success, NSError *error) {
                   if (success) {
                       [self successLogin];
                   }
                   else {
                       [self failedLogin];
                   }
        }];
    }
    else {
       NSLog(@"Can not evaluate Touch ID");
    }
}

- (void)successLogin{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Success"
                                       message:@"Successfully logged in"
                                       preferredStyle:UIAlertControllerStyleAlert];
         
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {}];
         
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    });
}

- (void)failedLogin{
    NSLog(@"Error received");
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                       message:@"Not logged in!"
                                       preferredStyle:UIAlertControllerStyleAlert];
         
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {}];
         
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    });

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
