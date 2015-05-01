//
//  Store.h
//  stlMaps
//
//  Created by Travis Delly on 4/23/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#ifndef __stlMaps__Store__
#define __stlMaps__Store__

#include <stdio.h>

#endif /* defined(__stlMaps__Store__) */


//Supplier

#include <iostream>
#include <string>

using namespace std;

class Supplier
{
public:
    
    Supplier();
    Supplier(string, string, string);
    
    void setSupplierID(string supplierID);
    string getSupplierID();
    
    void setSupplierName(string supplierName);
    string getSupplierName();
    
    void setSupplierE(string eMail);
    string getSupplierE();
    
    string getListof();
    
    
    
private:
    string supplierID;
    string supplierName;
    string eMail;
};

