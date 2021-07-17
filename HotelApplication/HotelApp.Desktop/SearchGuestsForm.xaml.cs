using HotelAppLibray.Data;
using HotelAppLibray.Models;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace HotelApp.Desktop
{

    public partial class SearchGuestsForm : Window
    {
        private readonly IDatabaseData db;

        public SearchGuestsForm(IDatabaseData db)
        {
            InitializeComponent();
            this.db = db;
        }

        private void SearchForGuests_Click(object sender, RoutedEventArgs e)
        {
            List<BookingFullModel> bookings = db.SearchBookings(lastNameText.Text);
            resultsList.ItemsSource = bookings; // The issue seems to be here - 
        }

        private void CheckInButton_Click(object sender, RoutedEventArgs e)
        {
            CheckinForm checkInForm = App.serviceProvider.GetService<CheckinForm>();
            BookingFullModel model = (BookingFullModel)((Button)e.Source).DataContext;

            checkInForm.PopulateCheckInInfo(model);
            checkInForm.Show();
        }
    }
}
