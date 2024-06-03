using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace ProgramAssignWebAPI.Models.Domain
{
    public class Email
    {
        [Key]
        public int SNo { get; set; }
        public string ToEmail { get; set; }
        public string CC { get; set; }
        public string Subjects { get; set; }
        public string Body { get; set; }
        public string App { get; set; }
    }
}
