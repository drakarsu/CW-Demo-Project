public class leadUI {

public static string methodName(){
    
}
    @AuraEnabled
    public static String CreateAd(Ad_c SingleAd){
        List<Campaign> singleCampaign = new List<Campaign>();
        String searchCamp = '%' + singleAd.UTM_Source_c + '%'; //Webinar
        String result;

        singleCampaign = [SELECT Id, Name, isActive FROM Campaign WHERE (Name LIKE :searchCamp AND isActive=true) LIMIT 1];

        if (singleCampaing.size()==0) {
            insert SingleAd;            
        } else {
            SingleAd.Campaign_c = singleCampaign.get(0).Id;
            insert SingleAd;
        }

        Result = singleAd.Id;

        return Result;

    }

    @AuraEnabled
    public static String CreateLead (Lead singleLead, String Search){

        List <Campaign> singleCampaign = new List<Campaign>();
        CampaignMember singleCampaignMember = new CampaignMember();

        String searchCamp = '%' + Search + '%';
        String Result;

        singleCampaign = [SELECT Id, Name, IsActive FROM Campaign WHERE Name LIKE :searchCamp AND 
        IsActive = true LIMIT 1];

        if (singleCampaign.size() == 0) {
            insert singleLead;
            
        }else {
            insert singleLead;
            singleCampaignMember.CampaignId = singleCampaign.get(0).Id;
            singleCampaignMember.LeadId = singleCampaign.Id;
            singleCampaignMember.Status = 'Received';

            insert singleCampaignMember;
        }

        Result = singleLead.Id;

        return Result;

    }

}
