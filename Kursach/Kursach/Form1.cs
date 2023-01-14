using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Kursach
{
    public partial class Form1 : Form
    {

        SqlConnection Kurs;
        DataTable First;
        DataTable Second;
        DataTable Cpmpany;
        DataTable NameCpmpany;
        DataTable Product;
        DataTable Buyer;
        DataTable AddBuyer;
        DataTable NewCheque;
        DataTable Entered;
        DataTable NewProduct;
        DataTable IdCheque;
        DataTable AddTypePayment;
        DataTable Payment;
        DataTable DeleteCheque;
        SqlDataAdapter Aboba;
        SqlDataAdapter Aboba2;
        string connect = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Games\\Kursach\\Kursach\\DB\\Продажа_товаров.mdf;Integrated Security=True";
        //string connect = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Games\\Kursach\\Kursach\\DB\\DB.mdf;Integrated Security=True"; // "30032"
        string id_cashier;
        string id_cheque;
        string id_byuer;


        private void Exeptions(int CodeErrore)
        {
            if (CodeErrore > 0)
            {
                if (CodeErrore == 1)
                {
                    label4.Text = "Успешное обновление таблицы";
                }
                else
                {
                    if (CodeErrore == 2)
                    {
                        label4.Text = "Успешное удаление записи";
                    }
                    else
                    {
                        if (CodeErrore == 3)
                        {
                            label4.Text = "Успешное добавление записи";
                        }
                        else
                        {
                            if (CodeErrore == 4)
                            {
                                label4.Text = "Запрос(ы) успешно завершен(ы)";
                            }
                            else
                            {
                                label4.Text = "Курсор выполнил функцию удаления товара со склада";
                            }
                        }
                    }
                }
            }
            else
            {
                if (CodeErrore == 0)
                {
                    MessageBox.Show("Ошибка, введены некорректные данные");
                }
                else
                {
                    if (CodeErrore == -1)
                    {

                        MessageBox.Show("Ошибка, в чеке нет продуктов");
                    }
                    else
                    {
                        if (CodeErrore == -2)
                        {
                            MessageBox.Show("Ошибка, нельзя удалить чек, который имеет статус “оплачен”");
                        }
                        else
                        {
                            MessageBox.Show("Ошибка, нельзя менять параметры в уже закрытом чеке");
                        }
                    }
                }
            }
        }


        public void ObnovaTable()
        {
            
            First = new DataTable();
            Aboba = new SqlDataAdapter(@"SELECT * FROM Cheque", Kurs);
            Aboba.Fill(First);
            dataGridView1.DataSource = First;
        }

            public Form1()
            {
            InitializeComponent();
            }

        private void Form1_Load(object sender, EventArgs e)
        {
            Kurs = new SqlConnection(connect);
            Kurs.Open();

            ObnovaTable();
            //First = new DataTable();
            //Aboba = new SqlDataAdapter(@"SELECT * FROM Cheque", Kurs);
            //Aboba.Fill(First);
            //dataGridView1.DataSource = First;
            //dataGridView1.Columns[0].HeaderText = "ебать";


            Second = new DataTable();
            Aboba = new SqlDataAdapter(@"SELECT id_cashier, 
                                    CASE
                                    WHEN otchestvi_cashier IS not null THEN fam_cashier + ' ' + name_cashier + ' ' + otchestvi_cashier
                                    ELSE fam_cashier + ' ' + name_cashier
                                    END FIO FROM Cashier
                                    ", Kurs);
            Aboba.Fill(Second);
            comboBox1.DataSource = Second;
            comboBox1.DisplayMember = "FIO";
            comboBox1.ValueMember = "id_cashier";

            //Product = new DataTable();
            //Aboba = new SqlDataAdapter(@"SELECT id_product, name_product FROM Product WHERE count_product_on_warehose > 1", Kurs);
            //Aboba.Fill(Product);
            //comboBox2.DataSource = Product;
            //comboBox2.DisplayMember = "name_product";
            //comboBox2.ValueMember = "id_product";

            Buyer = new DataTable();
            Aboba = new SqlDataAdapter(@"SELECT id_buyer, 
                                    CASE
                                    WHEN otchestvo_buyer IS not null THEN fam_buyer + ' ' + name_buyer + ' ' + otchestvo_buyer
                                    ELSE fam_buyer + ' ' + name_buyer
                                    END FIO FROM Buyer", Kurs);
            Aboba.Fill(Buyer);
            comboBox3.DataSource = Buyer;
            comboBox3.DisplayMember = "FIO";
            comboBox3.ValueMember = "id_buyer";



            //Payment = new DataTable();
            //Aboba = new SqlDataAdapter(@"SELECT type_payment FROM Payment", Kurs);
            //Aboba.Fill(Payment);
            //comboBox4.DataSource = Payment;
            //comboBox4.DisplayMember = "type_payment";
            //comboBox4.ValueMember = "type_payment";

            Cpmpany = new DataTable();
            Aboba = new SqlDataAdapter(@"SELECT name_company FROM Company", Kurs);
            Aboba.Fill(Cpmpany);
            comboBox5.DataSource = Cpmpany;
            comboBox5.DisplayMember = "name_company"; 
            comboBox5.ValueMember = "name_company";

            Kurs.Close();

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Kurs = new SqlConnection(connect);
            Kurs.Open();

            string id_reg_lent = "1000000001",
            id_cash_register = "6";
            string error;

            id_cashier = comboBox1.SelectedValue.ToString(); //вернет ид

            NewCheque = new DataTable();
            Aboba = new SqlDataAdapter(@" DECLARE @errore as int
                                        EXEC @errore = CreateNewCheque " + id_cashier + ", " + id_reg_lent + ", " + id_cash_register + "  SELECT @errore", Kurs);
            Aboba.Fill(NewCheque);
            error = NewCheque.Rows[0][0].ToString();
            Exeptions(Convert.ToInt32(error));


            
            IdCheque = new DataTable();
            Aboba = new SqlDataAdapter(@"SELECT id_fisc_check FROM Cheque WHERE result IS NULL AND change IS NULL AND id_status IS NULL", Kurs);
            Aboba.Fill(IdCheque);
            id_cheque = IdCheque.Rows[0][0].ToString();



            First = new DataTable();
            Aboba = new SqlDataAdapter("SELECT * FROM Cheque", Kurs);
            Aboba.Fill(First);
            dataGridView1.DataSource = First;
            
            Kurs.Close();
            button4.Visible = true;
            button1.Visible = false;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            

//            string prod = comboBox2.SelectedValue.ToString();

//            string count = Convert.ToString(textBox1.Text);

//            Kurs = new SqlConnection(connect);
//            Kurs.Open();

//            NewProduct = new DataTable();
//            Aboba2 = new SqlDataAdapter(@"
//BEGIN
//	If(" + id_cheque + @" in (SELECT id_fisc_check FROM Cheque) AND " + prod + @" in (SELECT id_product FROM Product))

//    BEGIN
//		INSERT INTO [Product-Cheque] (id_fisc_check, id_product, count_product)
//		VALUES (" + id_cheque + ", " + prod + ", " + count + @")
 
//	END
//END
//", Kurs);
//            Aboba2.Fill(NewProduct);
//            //string error = NewProduct.Rows[0][0].ToString();
//            //Exeptions(Convert.ToInt32(error));
//            dataGridView1.DataSource = NewProduct;

//            //First = new DataTable();
//            //Aboba = new SqlDataAdapter(@"SELECT * FROM [Product-Cheque]", Kurs);
//            //Aboba.Fill(First);
//            //dataGridView1.DataSource = First;
//            Kurs.Close();

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Kurs = new SqlConnection(connect);
            Kurs.Open();
            string name = textBox1.Text;
            string pattern = @"^[А-Я][а-я]{1,12}$";
            //Regex regex = new Regex(@"^[А-Я][а-я]{1,12}$");
            if (Regex.IsMatch(name, pattern))
            {
                id_byuer = comboBox3.SelectedValue.ToString();
                AddBuyer = new DataTable();
                Aboba = new SqlDataAdapter(@"UPDATE Buyer SET name_buyer = '" + name + "' WHERE id_buyer = " + id_byuer, Kurs);
                //string sql = "EXEC AddChequeByer " + id_cheque + ", " + id_byuer;
                // command3 = new SqlCommand(sql, Kurs);

                Aboba.Fill(AddBuyer);
                //string error = AddBuyer.Rows[0][0].ToString();
                //Exeptions(Convert.ToInt32(error));

                First = new DataTable();
                Aboba = new SqlDataAdapter(@"SELECT * FROM Buyer", Kurs);
                Aboba.Fill(First);
                dataGridView1.DataSource = First;


                Buyer = new DataTable();
                Aboba = new SqlDataAdapter(@"SELECT id_buyer, 
                                    CASE
                                    WHEN otchestvo_buyer IS not null THEN fam_buyer + ' ' + name_buyer + ' ' + otchestvo_buyer
                                    ELSE fam_buyer + ' ' + name_buyer
                                    END FIO FROM Buyer", Kurs);
                Aboba.Fill(Buyer);
                comboBox3.DataSource = Buyer;
                comboBox3.DisplayMember = "FIO";
                comboBox3.ValueMember = "id_buyer";

            }
            else
            {
                MessageBox.Show("Ошибка, введены некорректные данные!");
            }
            

            Kurs.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Kurs = new SqlConnection(connect);
            Kurs.Open();


            DeleteCheque = new DataTable();
            Aboba = new SqlDataAdapter(@"DECLARE @errore as int
                                        EXEC @errore = DelitedCheque " + id_cheque + "  SELECT @errore", Kurs);
            Aboba.Fill(DeleteCheque);
            string error = DeleteCheque.Rows[0][0].ToString();
            Exeptions(Convert.ToInt32(error));

            ObnovaTable();
            Kurs.Close();
            button4.Visible = false;
            button1.Visible = true;
        }

        private void button5_Click(object sender, EventArgs e)
        {

            //string name_payment = comboBox4.SelectedValue.ToString();

            //Kurs = new SqlConnection(connect);
            //Kurs.Open();
            //AddTypePayment = new DataTable();
            //Aboba = new SqlDataAdapter(@"DECLARE @errore as int
            //                            EXEC @errore = AddChequePayment " + id_cheque + ", " + name_payment + "  SELECT @errore", Kurs);
            //Aboba.Fill(AddTypePayment);
            //string error = AddTypePayment.Rows[0][0].ToString();
            //Exeptions(Convert.ToInt32(error));

            //ObnovaTable();
            //Kurs.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            //string entered = Convert.ToString(textBox2.Text);


            //Kurs = new SqlConnection(connect);
            //Kurs.Open();

            //Entered = new DataTable();
            //Aboba = new SqlDataAdapter(@"DECLARE @errore as int
            //                            EXEC @errore = AddChequeEnteredCash " + id_cheque + ", " + entered + "  SELECT @errore", Kurs);
            //Aboba.Fill(Entered);
            //string error = Entered.Rows[0][0].ToString();
            //Exeptions(Convert.ToInt32(error));

            //ObnovaTable();
            //Kurs.Close();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            //string prod = comboBox2.SelectedValue.ToString();

            //string count = Convert.ToString(textBox1.Text);

            //Kurs = new SqlConnection(connect);
            //Kurs.Open();

            //NewProduct = new DataTable();
            //Aboba = new SqlDataAdapter(@"DECLARE @errore as int
            //                            EXEC @errore = DelProductFromCheque " + id_cheque + ", " + prod + ", " + count + "  SELECT @errore", Kurs);
            //Aboba.Fill(NewProduct);
            //string error = NewProduct.Rows[0][0].ToString();
            //Exeptions(Convert.ToInt32(error));

            //ObnovaTable();
            //Kurs.Close();
        }

        private void button8_Click(object sender, EventArgs e)
        {

            //EXEC AVGoneCheque '" + name_company + "', '" + start_date + "', '" + stop_date + "'
            string name_company = comboBox5.SelectedValue.ToString();
            string start_date = Convert.ToString(dateTimePicker1.Value.ToString());
            string stop_date = Convert.ToString(dateTimePicker2.Value.ToString());

            Kurs = new SqlConnection(connect);
            Kurs.Open();
            NameCpmpany = new DataTable();
            Aboba = new SqlDataAdapter(@"EXEC AVGoneCheque '" + name_company + "', '" + start_date + "', '" + stop_date + "'", Kurs);
            Aboba.Fill(NameCpmpany);
            dataGridView2.DataSource = NameCpmpany;
            
            Kurs.Close();

        }
    }
}
