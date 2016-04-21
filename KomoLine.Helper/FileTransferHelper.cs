using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace KomoLine.Helper
{
    public class FileTransferHelper
    {
        public static void DownloadFile(string FilePath, bool IsRelative = true, string FileName = "", string MimeType = "application/octet-stream")
        {
            try
            {
                HttpResponse Response = HttpContext.Current.Response;
                HttpServerUtility Server = HttpContext.Current.Server;
                HttpApplication Application = HttpContext.Current.ApplicationInstance;

                if (string.IsNullOrWhiteSpace(FileName)) FileName = Path.GetFileName(FilePath);
                if (IsRelative) FilePath = Server.MapPath(FilePath);
                string Header = "Attachment; Filename=\"" + FileName + "\"";
                System.IO.FileInfo file = new System.IO.FileInfo(FilePath);

                Response.Clear();
                Response.ContentType = MimeType;
                Response.AppendHeader("Content-Disposition", Header);
                Response.AppendHeader("Content-Length", file.Length.ToString());
                Response.TransmitFile(file.FullName);
                Response.Flush();
                Response.End();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void DownloadStream(Stream data, string fileName, string mimeType = "application/octet-stream")
        {
            try
            {
                HttpResponse Response = HttpContext.Current.Response;
                HttpServerUtility Server = HttpContext.Current.Server;
                HttpApplication Application = HttpContext.Current.ApplicationInstance;

                string Header = "Attachment; Filename=\"" + fileName + "\"";

                Response.Clear();
                Response.ContentType = mimeType;
                Response.AppendHeader("Content-Disposition", Header);
                Response.AppendHeader("Content-Length", data.Length.ToString());
                data.CopyTo(Response.OutputStream);
                Response.End();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static string UploadFile(HttpPostedFile File, string DirectoryPath, string SaveAs = null)
        {
            HttpRequest Request = HttpContext.Current.Request;
            HttpServerUtility Server = HttpContext.Current.Server;

            //Create new directory if not exists
            if (!Directory.Exists(DirectoryPath))
            {
                Directory.CreateDirectory(DirectoryPath);
            }

            // Upload file
            if (File.ContentLength > 0)
            {
                //Save files inside directory
                try
                {
                    string filePath = DirectoryPath;
                    if (string.IsNullOrWhiteSpace(SaveAs))
                    {
                        filePath = Path.GetFileName(File.FileName);
                    }
                    else
                    {
                        filePath = Path.GetFileName(SaveAs + Path.GetExtension(File.FileName));
                    }
                    File.SaveAs(filePath);
                    return filePath;
                }
                catch (Exception)
                {
                    throw;
                }

            }
            else
            {
                throw new Exception(Message.ERR_UPLOAD_FILE);
            }
        }
    }
}
