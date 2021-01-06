#ifndef _SALARIEDEMPLOYEE_H
#define _SALARIEDEMPLOYEE_H

#include <string>

using namespace std;

class SalariedEmployee:Employee {
    private:

    double weeklySalary;

    public:

    SalariedEmployee();
    SalariedEmployee(string firstName, string lastName, double weeklySalary);

    string getInfo();
    string getEarning();


};

#endif