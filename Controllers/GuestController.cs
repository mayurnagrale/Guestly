using Guestly.Data;
using Guestly.Models;
using Guestly.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Guestly.Controllers
{
    public class GuestController : Controller
    {
        private readonly GuestlyDbContext _db;

        public GuestController(GuestlyDbContext db)
        {
            _db = db;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(GuestAndAddress model)
        {
            ModelState.Remove("AddressInfo.GuestInfo");
            ModelState.Remove("GuestInfo.AddressInfo");

            foreach (var key in ModelState.Keys)
            {
                Console.WriteLine(key);
            }
            
            foreach (var modelState in ModelState.Values)
            {
                foreach (var error in modelState.Errors)
                {
                    Console.WriteLine(error.ErrorMessage);
                    
                }
            }


            if (ModelState.IsValid)
            {
                model.GuestInfo.AddressInfo = model.AddressInfo;
                _db.GuestInfos.Add(model.GuestInfo);
                _db.SaveChanges();

                TempData["SuccessMessage"] = "Data has been saved successfully.";

                return RedirectToAction("Index");
            }
            // If there are validation errors, return to the same view with the model.
            return View("Index",model);
        }
    }
}
