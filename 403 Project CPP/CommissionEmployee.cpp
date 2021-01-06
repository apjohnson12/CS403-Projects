#include "CommissionEmployee.h"

CommissionEmployee::CommissionEmployee():Employee() {
    minimumSalary = 0;
    sales = 0;
    commissionRate = 0;
}

CommissionEmployee::CommissionEmployee(string firstName, string lastName, double minimumSalary, double sales, double commissionRate):Employee(firstName, lastName) {
    this->minimumSalary = minimumSalary;
    this->sales = sales;
    this->commissionRate = commissionRate;
}

CommissionEmployee::~CommissionEmployee() = default;

string CommissionEmployee::getInfo() {
    char work[20];
    sprintf(work, "%.2lf", this->minimumSalary);
    string minimumSalary = string(work);

    sprintf(work, "%.2lf", this->sales);
    string sales = string(work);

    sprintf(work, "%.2lf", this->commissionRate*100);
    string commissionRate = string(work);

    return "Commission Employee: " + Employee::getInfo() + "\nminimum salary: " + minimumSalary + ", sales amount: " + sales + ", commision rate: " + commissionRate + "%";
}

double CommissionEmployee::getEarning() {
    //char work[20];
    if (minimumSalary > sales*commissionRate) {
        //sprintf(work, "%.2lf", minimumSalary);
        return minimumSalary;
    }
    else {
        //sprintf(work, "%.2lf", sales*commissionRate);
        return sales*commissionRate;
    }

   
}