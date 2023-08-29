using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Guestly.Models
{
    public class GuestInfo
    {
        [Key]
        public int GuestId { get; set; }

        [Required(ErrorMessage = "Guest Name is required")]
        public string? GuestName { get; set; }
        public string? Telephone { get; set; }

        [Required(ErrorMessage = "Mobile is required")]
        public string? Mobile { get; set; }
        public string? Fax { get; set; }
        public string? Email { get; set; }
        public string? WebSite { get; set; }
        public AddressInfo AddressInfo { get; set; }
    }
}
