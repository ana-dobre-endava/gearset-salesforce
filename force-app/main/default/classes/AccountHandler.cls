public with sharing class AccountHandler {
   public static void updateAccountsIndustry(String oldIndustry, String newIndustry) {
        List<Account> accountsToUpdate = [SELECT Id, Industry FROM Account WHERE Industry = :oldIndustry];
        
        for (Account acc : accountsToUpdate) {
            acc.Industry = newIndustry;
        }
        
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }

    public static Integer countAccountsByIndustry(String industry) {
        return [SELECT COUNT() FROM Account WHERE Industry = :industry];
    }
}