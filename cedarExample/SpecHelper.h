//
//  SpecHelper.h
//  cedarExample
//
//  Created by Nico on 4/15/16.
//  Copyright © 2016 Globant. All rights reserved.
//

#import <Cedar/Cedar.h>
#import <Blindside/Blindside.h>

@protocol BSInjector;
@protocol BSBinder;

@interface CDRSpecHelper (cedarExample)

+ (id<BSInjector, BSBinder>)injector;

@end
