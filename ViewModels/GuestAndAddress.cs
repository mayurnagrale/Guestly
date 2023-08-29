using Guestly.Models;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace Guestly.ViewModels
{
    public class GuestAndAddress
    {
        public GuestInfo GuestInfo { get; set; }
        public AddressInfo AddressInfo { get; set; }
    }
}
