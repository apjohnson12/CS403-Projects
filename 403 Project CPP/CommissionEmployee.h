#ifndef _COMMISSION_EMPLOYEE_H
#define _COMMISSION_EMPLOYEE_H

#include "Employee.h"

class CommissionEmployee : public Employee {
    private:

    double minimumSalary, sales, commissionRate;

    public:

    CommissionEmployee();
    CommissionEmployee(string firstName, string lastName, double minimumSalary, double sales, double commissionRate);
    ~CommissionEmployee();

    string getInfo();
    double getEarning();
};

#endif
