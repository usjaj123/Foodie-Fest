#include<R.h>

#define Foodie_Fest_MAX_CUSTOMERS 1000

// Function to print list of customers
void print_customers(char customers[Foodie_Fest_MAX_CUSTOMERS][80]) {
  int i;
  for (i=0; i<Foodie_Fest_MAX_CUSTOMERS; i++)
    Rprintf("%s\n", customers[i]); 
}

//Function to read customer data from file
void read_customer_data(char customers[Foodie_Fest_MAX_CUSTOMERS][80], char* filename) {
	int i=0;
	FILE *fp;
	fp = fopen(filename, "r");
	if (fp == NULL) {
		Rprintf("Error opening file\n");
		return;
	}		
	while(fgets(customers[i], 80, fp) != NULL) {
		i++;
	}
	fclose(fp);
	Rprintf("%d customers have been read from %s\n", i, filename);
} 

//Function to Write customer data into a file
void write_customer_data(char customers[Foodie_Fest_MAX_CUSTOMERS][80], char* filename) {
	int i;
	FILE *fp;
	fp = fopen(filename, "w");
	if (fp == NULL) {
		Rprintf("Error opening file\n");
		return;
	}	
	for (i=0; i<Foodie_Fest_MAX_CUSTOMERS; i++)
		fputs(customers[i], fp); 
	fclose(fp);
	Rprintf("%d customers have been written to %s\n", i, filename);
} 

// Function to sort customers
void sort_customers(char customers[Foodie_Fest_MAX_CUSTOMERS][80]) {
  int i, j;
  char key[80];
  for (i=0; i<Foodie_Fest_MAX_CUSTOMERS; i++) {
    strcpy(key, customers[i]);
    j=i-1;
    while(j>=0 && strcmp(customers[j], key)>0) {
      strcpy(customers[j+1], customers[j]);
      j--;
    }
    strcpy(customers[j+1], key);
  } 
}

// Function to add a customer
void add_customer(char customers[Foodie_Fest_MAX_CUSTOMERS][80], char* customer_name) {
  if (customer_name == NULL || Foodie_Fest_MAX_CUSTOMERS <= 0)
    return;
    
  static int i=0;
  strcpy(customers[i], customer_name); 
  i++;
  sort_customers(customers);
  
  Rprintf("Customer %s has been added\n", customer_name);
}

// Function to remove a customer
void remove_customer(char customers[Foodie_Fest_MAX_CUSTOMERS][80], char* customer_name) {
  if (customer_name == NULL || Foodie_Fest_MAX_CUSTOMERS <= 0)
    return;
    
  int i;
  for (i=0; i<Foodie_Fest_MAX_CUSTOMERS; i++) {
    if (strcmp(customers[i], customer_name)==0) {
      strcpy(customers[i], "");
      Rprintf("Customer %s has been removed\n", customer_name);
      break;
    }
  }
  sort_customers(customers);
} 

// Function to search customer
void search_customer(char customers[Foodie_Fest_MAX_CUSTOMERS][80], char* customer_name) {
  int i;
  for (i=0; i<Foodie_Fest_MAX_CUSTOMERS; i++) {
    if (strcmp(customers[i], customer_name)==0) {
      Rprintf("Customer %s found\n", customer_name);
      return;
    }
  }
  
  Rprintf("Customer %s not found\n", customer_name);
} 

// Function to return number of customers at Foodie Fest
int total_customers(char customers[Foodie_Fest_MAX_CUSTOMERS][80]) {
  int i, count=0;
  for (i=0; i<Foodie_Fest_MAX_CUSTOMERS; i++) {
    if (strcmp(customers[i], "") != 0)
      count++;
  }
  return count;
}

// Main Function
int main(int argc, char *argv[]) { 
  char customers[Foodie_Fest_MAX_CUSTOMERS][80];

  // Read customer data from file
  read_customer_data(customers, "customers.txt");

  // Print list of customers
  Rprintf("\nList of customers:\n");
  print_customers(customers);
  
  // Add new customers
  add_customer(customers, "John");
  add_customer(customers, "Jane");
  add_customer(customers, "Bob");

  // Print list of customers
  Rprintf("\nList of customers after additions:\n");
  print_customers(customers);
  
  // Remove a customer
  remove_customer(customers, "Bob");

  // Print list of customers
  Rprintf("\nList of customers after removal:\n");
  print_customers(customers);
  
  // Search for a customer
  search_customer(customers, "John");
  search_customer(customers, "Bob");
  
  // Print total number of customers at Foodie Fest
  int num_customers = total_customers(customers);
  Rprintf("\n%d customers are attending Foodie Fest\n", num_customers);

  // Write customer data into a file
  write_customer_data(customers, "updated_customers.txt");
  return 0;  
}