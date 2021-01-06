#include "SalariedEmployee.h"

SalariedEmployee::SalariedEmployee():Employee() {
    
    weeklySalary = 0;
}

SalariedEmployee::SalariedEmployee(string firstName, string lastName, double weeklySalary):Employee(firstName, lastName) {
    this->weeklySalary = weeklySalary;
}

SalariedEmployee::~SalariedEmployee() = default;

string SalariedEmployee::getInfo() {
    char work[20];
    sprintf(work, "%.2lf", weeklySalary);
    return "Salaried employee: " + Employee::getInfo() + "\nweekly salary: " + string(work);
}

double SalariedEmployee::getEarning() {
    //char work[20];
    //sprintf(work, "%.2lf", weeklySalary);
    return weeklySalary; 
}