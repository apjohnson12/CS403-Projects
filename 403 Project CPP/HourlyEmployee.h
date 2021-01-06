#ifndef _HOURLY_EMPLOYEE_H
#define _HOURLY_EMPLOYEE_H

#include "Employee.h"

class HourlyEmployee : public Employee {
    private:

    double hours;
    double rate;

    public:

    HourlyEmployee();
    HourlyEmployee(string firstName, string lastName, double hours, double rate);
    ~HourlyEmployee();

    string getInfo();
    double getEarning();
};

#endif