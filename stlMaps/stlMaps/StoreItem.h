//
//  StoreItem.h
//  stlMaps
//
//  Created by Travis Delly on 4/23/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#ifndef __stlMaps__StoreItem__
#define __stlMaps__StoreItem__

#include <stdio.h>

#endif /* defined(__stlMaps__StoreItem__) */

#ifndef __SUPPLIER
#define __SUPPLIER

#include <iostream>
#include <string>
#include "Store.h"
#include <vector>

using namespace std;

class StoreItem{
public:
    
    
    double getPrice();
    int getAmmount();
    string getDesc();
    string getName();
    /*Get methods*/
    
    void setDesc(string Desc);
    void setName(string name);
    void setPrice(double price);
    void setAmmount(int ammount);
    void setItemKey(string itemKey);
    /*set Methods*/
    
    /*Supplier object*/
    void setSupplierID(string supplierID);
    string getSupplierID();
    string getItemKey();
    
    void setSupplierName(string supplierName);
    string getSupplierName();
    
    void setSupplierE(string eMail);
    string getSupplierE();
    /*End object*/
    
    string toString();
    
    StoreItem();
    StoreItem(string, string, double, int, string);
    
private:
    string itemKey;
    Supplier supplyList;
    string name;
    string description;
    double sellingPrice;
    int ammount;
    
    
};
#endif
