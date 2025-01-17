using Microsoft.EntityFrameworkCore.Metadata.Internal;
using ProgramAssignWebAPI.Models.Domain;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProgramAssignWebAPI.Models.DTO
{
    public class ResourceManagerHistoryDto
    {
        public int HistoryId { get; set; }
        public int Id { get; set; }
        public int VAMID { get; set; }
        public string TechTrack { get; set; }
        public string Email { get; set; }
        public string ResourceName { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }
        public string Manager { get; set; }
        public string SME { get; set; }
        public string SMEStatus { get; set; }
        public string ProgramStatus { get; set; }
        // FK Key For 
        public int ProgramsTrackerId { get; set; }
        // Navigation prop
        // Binding navigation prop back to the region
        public ProgramsTracker ProgramsTracker { get; set; }
        public string HistoryProgramTrackerId { get; set; }
        public string ActionType { get; set; }
        public string category { get; set; }
        // navigation prop for WalkDifficulty
        public string? SMEComments { get; set; }
        public string? ProgramCode { get; set; }
        public DateTime? AssociateSubmittedDate { get; set; }
        public int? AssociateDelayDays { get; set; }

    }
}
