using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DatabaseConnExample
{
    public class CustomerFileRepository : ICustomerRepository
    {
        public static string path = @"C:\Users\marta\Downloads\DatabaseConnectionExample-master\DatabaseConnectionExample-master\customers.txt";
        public bool AddCustomer(Customer customer)
        {
            try
            {
                string line = $"{customer.Id};{customer.Name};{customer.Surname}";
                List<string> lines = new List<string>() { line };
                File.AppendAllLines(path, lines);
            }
            catch(Exception ex)
            {               
                return false;
            }
            return true;
            
        }

        public List<Customer> GetCustomers()
        {
            List<Customer> customers = new List<Customer>();
            try
            {

                using (FileStream fileStream = new FileStream(path, FileMode.Open, FileAccess.Read))
                {
                    string line;
                    using (StreamReader sr = new StreamReader(fileStream))
                    {
                        while ((line = sr.ReadLine()) != null)
                        {
                            string[] elements = line.Split(';');
                            customers.Add(new Customer()
                            {
                                Id = Convert.ToInt32(elements[0]),
                                Name = elements[1],
                                Surname = elements[2]
                            });
                        }
                    }
                }
                
            }
            catch(Exception ex)
            {
                return null;
            }
            return customers;
        }

        public bool UpdateCustomer(Customer customer)
        {
            try
            {
                string[] lines = File.ReadAllLines(path);
      
                for(int i=0; i<lines.Length; i++)
                {
                    string[] elements = lines[i].Split(';');
                    if(Convert.ToInt32(elements[0]) == customer.Id)
                    {
                        lines[i] = $"{customer.Id};{customer.Name};{customer.Surname}";
                    }
                 
                }
                File.WriteAllLines(path, lines);
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }
    }
}
