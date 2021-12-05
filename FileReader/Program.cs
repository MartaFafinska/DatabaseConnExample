using System;
using System.Collections.Generic;

namespace DatabaseConnExample
{
    class Program
    {
        static void Main(string[] args)
        {
            ICustomerRepository customerRepository = new CustomerFileRepository();

            List<Customer> customers = customerRepository.GetCustomers();

            DisplayCustomers(customers);

            Customer customer = new Customer()
            {
                Id = 124,
                Name = "Piotr",
                Surname = "Kowalski"
            };
            customerRepository.AddCustomer(customer);

            customers = customerRepository.GetCustomers();

            DisplayCustomers(customers);

            customer.Surname = "Lewandowski";

            customerRepository.UpdateCustomer(customer);

            customers = customerRepository.GetCustomers();

            DisplayCustomers(customers);

            Console.ReadLine();
        }

        private static void DisplayCustomers(List<Customer> customers)
        {
            foreach(Customer customer in customers)
            {
                Console.WriteLine($"{customer.Id} {customer.Name} {customer.Surname}");                
            }
            Console.WriteLine("--------------------------------------------------");
        }
    }
}
