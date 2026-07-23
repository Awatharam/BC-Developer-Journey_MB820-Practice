xmlport 50101 "Customer Export"
{
    Format = Xml;
    Direction = Export;
    Caption = 'Customer Export';

    schema
    {
        textelement(Customers)
        {
            tableelement(Customer; Customer)
            {
                XmlName = 'Customer';

                fieldattribute(No; Customer."No.") { }
                fieldattribute(Name; Customer.Name) { }
                fieldelement(Priority; Customer."Customer Priority") { }
            }
        }
    }
}