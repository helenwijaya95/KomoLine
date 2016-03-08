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

        public static bool UploadFile(HttpPostedFile File, string DirectoryPath)
        {
            HttpRequest Request = HttpContext.Current.Request;
            HttpServerUtility Server = HttpContext.Current.Server;

            //Create new directory if not exists
            string directoryPath = DirectoryPath;
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            // Get file size
            int FileSize = File.ContentLength;

            // Upload file
            if (FileSize > 0)
            {
                //Save files inside directory
                try
                {
                    File.SaveAs(directoryPath + System.IO.Path.GetFileName(File.FileName));
                    //File.SaveAs(directoryPath + System.IO.Path.GetFileName(File.FileName));
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message.ToString());
                }

            }
            else
            {
                throw new Exception(Message.ERR_UPLOAD_FILE);
            }
        }
    }
}
