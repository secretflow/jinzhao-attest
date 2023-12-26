#include "attestation/generation/ua_generation.h"
#include "stdio.h"

int main(){
  kubetee::attestation::UaReportGenerationParameters gen_param;
  gen_param.tee_identity = "1";
  gen_param.report_type = "Passport";

  kubetee::UnifiedAttestationReport report;
  UaGenerateReport(&gen_param, &report);

  printf("generate ok\n");
}