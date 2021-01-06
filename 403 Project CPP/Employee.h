#ifndef _EMPLOYEE_H
#define _EMPLOYEE_H

#include <string>
#include <iostream>

using namespace std;

class Employee {
    private:

    string firstName;
    string lastName;

    public:

    Employee (string firstName, string lastName);
    Employee ();
    virtual ~Employee() = 0;
    string getFirstName();
    string getLastName();

    virtual string getInfo();
    virtual double getEarning();

};

#include "SalariedEmployee.h"
#include "CommissionEmployee.h"
#include "HourlyEmployee.h"
#endif