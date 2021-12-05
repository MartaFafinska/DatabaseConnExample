using System;
using System.Collections.Generic;
using System.Text;

namespace DatabaseConnExample
{
    interface ICustomerRepository
    {
        List<Customer> GetCustomers();
        bool AddCustomer(Customer customer);
        bool UpdateCustomer(Customer customer);
    }
}
