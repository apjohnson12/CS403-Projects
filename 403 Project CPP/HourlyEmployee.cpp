#include "HourlyEmployee.h"

HourlyEmployee::HourlyEmployee():Employee() {
    hours = 0;
    rate = 0;
}

HourlyEmployee::HourlyEmployee(string firstName, string lastName, double hours, double rate):Employee(firstName, lastName) {
    this->hours = hours;
    this->rate = rate;
}

HourlyEmployee::~HourlyEmployee() = default; 

string HourlyEmployee::getInfo() {
    char work[20];
    sprintf(work, "%.2lf", this->hours);
    string hours = string(work);

    sprintf(work, "%.2lf", this->rate);
    string rate = string(work);

    return "Hourly Employee: " + Employee::getInfo() + "\nhours worked: " + hours + ", hourly rate: " + rate;

}

double HourlyEmployee::getEarning() {
    //char work[20];
    double pay = hours*rate;
    if (hours > 40) {
        pay += (hours - 40) * (rate/2);
    }
    if (hours > 50) {
        pay += (hours - 50) * (rate/2);
    }

    //sprintf(work, "%.2lf", pay);
    
    return pay;
}