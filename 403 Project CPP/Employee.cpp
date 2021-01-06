#include "Employee.h"

using namespace std;

Employee::Employee() {
    firstName = "";
    lastName = "";
}

Employee::Employee(string firstName, string lastName) {
    //cout << "In employee constructor" << endl;
    this->firstName = firstName;
    this->lastName = lastName;
    //cout << firstName << " " << lastName << endl;
}

Employee::~Employee(){

}

string Employee::getInfo() {
    //cout << "employee get info" << firstName << " " << lastName << endl;
    return firstName + " " + lastName;
}

double Employee::getEarning() {
    return 0.00;
}

string Employee::getFirstName() {
    return firstName;
}

string Employee::getLastName() {
    return lastName;
}