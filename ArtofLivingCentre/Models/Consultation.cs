//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ArtofLivingCentre.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Consultation
    {
        public int ConsultationId { get; set; }
        public System.DateTime StartDateTime { get; set; }
        public System.DateTime EndDateTime { get; set; }
        public string ReservationTitle { get; set; }
        public string ReservationStatus { get; set; }
        public int UserId { get; set; }
        public int ConsultantId { get; set; }
    
        public virtual User User { get; set; }
        public virtual Consultant Consultant { get; set; }
    }
}
