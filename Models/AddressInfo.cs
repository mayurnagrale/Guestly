using System.ComponentModel.DataAnnotations;

namespace Guestly.Models
{
    public class AddressInfo
    {
        [Key]
        public int AddressInfoId { get; set; }
        public string? Street { get; set; }
        public string? Number { get; set; }
        public string? Box { get; set; }
        public string? PostalCode { get; set; }
        public string? Country { get; set; }
        public string? Location { get; set; }

        public int GuestInfoID { get; set; }
        public GuestInfo GuestInfo { get; set; }
    }
}
