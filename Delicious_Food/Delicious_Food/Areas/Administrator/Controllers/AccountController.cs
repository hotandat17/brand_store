using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace Delicious_Food.Areas.Administrator.Controllers
{
    public class AccountController : Controller
    {
        Models.ShopperEntities dbLog = new Models.ShopperEntities();
        Delicious_Food.Repository.ShopDAO dao = new Delicious_Food.Repository.ShopDAO();
        // GET: Administrator/Account
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken()]
        public ActionResult Login(Models.Administrator adLogin)
        {
            try
            {
                var model = dbLog.Administrators.SingleOrDefault(a => a.adAcc.Equals(adLogin.adAcc));
                if (model != null)
                {
                    if (model.adPass.Equals(adLogin.adPass))
                    {
                        Session["accname"] = model.adAcc;
                        Session["fullname"] = model.fullname;
                        Session["gmail"] = model.gmail;
                        Session["address"] = model.address;
                        Session["adphone"] = model.adphone;
                       
                        Session["Imgtv"] = model.Imgtv;
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        Session["accname"] = null;
                        ViewBag.LoginError = "Sai tài khoản hoặc mật khẩu.";
                    }
                }
                else
                {
                    Session["accname"] = null;
                    ViewBag.LoginError = "Sai tài khoản hoặc mật khẩu.";
                }
            }
            catch (Exception)
            {
                Session["accname"] = null;
                ViewBag.LoginError = "Sai tài khoản hoặc mật khẩu.";
            }
            return View();
        }

        public ActionResult Logout()
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Session["accname"] = null;
            return RedirectToAction("Login", "Account");
        }
        public ActionResult registration()
        {
            
            return View();
        }
        [HttpPost]
        public ActionResult registration(Models.Administrator dktk, HttpPostedFileBase file)
        {
           
            if (file != null)
            {
                if (file.ContentLength > 0)
                {
                    try
                    {

                        string nameFile = Path.GetFileName(file.FileName);
                        file.SaveAs(Path.Combine(Server.MapPath("/ImgTV"), nameFile));
                        dktk.Imgtv = "/ImgTV/" + nameFile;
                    }
                    catch (Exception)
                    {
                        ViewBag.CreateCategory = "Không thể chọn ảnh.";
                    }
                }
                try
                {
                    if (dbLog.Administrators.SingleOrDefault(cr => cr.fullname.Equals(dktk.fullname)) == null)
                    {
                        dbLog.Administrators.Add(dktk);
                        dbLog.SaveChanges();
                        ViewBag.CreateCategory = "Thêm danh mục thành công.";
                    }
                    else
                    {
                        ViewBag.CreateCategory = "Tên danh mục đã tồn tại.";
                    }
                }
                catch (Exception)
                {
                    ViewBag.CreateCategory = "Không thể thêm danh mục.";
                }
            }
            else
            {
                ViewBag.HinhAnh = "Vui lòng chọn hình ảnh.";
            }


             dbLog.Administrators.Add(dktk);
            dbLog.SaveChanges();
            return RedirectToAction("Home", "Administrator");
        }
    }
}