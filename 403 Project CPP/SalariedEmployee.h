#ifndef _SALARIEDEMPLOYEE_H
#define _SALARIEDEMPLOYEE_H

#include "Employee.h"
#include <string>

using namespace std;

class SalariedEmployee : public Employee {
    private:

    double weeklySalary;

    public:

    SalariedEmployee();
    SalariedEmployee(string firstName, string lastName, double weeklySalary);
    ~SalariedEmployee();

    string getInfo();
    double getEarning();


};

#endif