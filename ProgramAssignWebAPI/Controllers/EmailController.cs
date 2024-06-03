using Microsoft.AspNetCore.Mvc;
using ProgramAssignWebAPI.Data;
using ProgramAssignWebAPI.Models.Domain;
using Microsoft.EntityFrameworkCore;
using ProgramAssignWebAPI.SendEmail;

namespace ProgramAssignWebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EmailController : Controller
    {
        private readonly AssignDbContext _fullStackDbContext;

        public EmailController(AssignDbContext fullStackDbContext)
        {
            _fullStackDbContext = fullStackDbContext;
        }

        [HttpPost]
        public async Task<IActionResult> CodeUpload([FromBody] CodeUploadEmail Details)
        {

            if (Details != null)
            {
                var store = _fullStackDbContext.ResourceMangerAssignments.FirstOrDefault(l => l.ResourceName == Details.AssociateName);
                if (store != null)
                {

                    string body = $"Dear {store.SME}, \r\n\r\n {Details.AssociateName} has completed uploading attachment for <program name> & {Details.TechTrack}. The status of this program is “{Details.SMEStatus}”. Please follow the link to download the attachment shared by {Details.AssociateName} and review/ approve with your necessary comments. \r\n [LinkToApp](https://code-excer.azurewebsites.net/) \r\n \r\n Regards,\r\n Valuemomentum";

                    ProgramAssignWebAPI.Models.Domain.Email obj = new ProgramAssignWebAPI.Models.Domain.Email();

                    obj.ToEmail = store.SME;
                    obj.CC = store.Manager;
                    obj.App = "AutoAssign";
                    obj.Body = body;
                    obj.Subjects = $"Assigned Exercise || {Details.AssociateName}";

                    await _fullStackDbContext.Email.AddAsync(obj);
                    await _fullStackDbContext.SaveChangesAsync();
                }
            }
            return Ok();
        }

        [HttpPost]
        [Route("Comments")]
        public async Task<IActionResult> Comments([FromBody] EmailComments comment)
        {

            if (comment != null)
            {
                var store1 = _fullStackDbContext.ResourceMangerAssignments.FirstOrDefault(l => l.ResourceName == comment.AssociateName);
                if (store1 != null)
                {

                    string body = $"Dear {comment.AssociateName}, \r\n\r\n Here are the few comments your SME has provided \r\n{comment.Comments} \r\n \r\n Regards,\r\n Valuemomentum";

                    ProgramAssignWebAPI.Models.Domain.Email obj = new ProgramAssignWebAPI.Models.Domain.Email();

                    obj.ToEmail = store1.Email;
                    obj.CC = store1.Manager;
                    obj.App = "AutoAssign";
                    obj.Body = body;
                    obj.Subjects = $"Comments || {comment.AssociateName}";

                    await _fullStackDbContext.Email.AddAsync(obj);
                    await _fullStackDbContext.SaveChangesAsync();
                }
            }
            return Ok();
        }
    }
}
