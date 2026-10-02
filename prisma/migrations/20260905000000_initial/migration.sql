-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DischargeFacility" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "permitNumber" TEXT NOT NULL,
    "operator" TEXT NOT NULL,
    "sewerAuthority" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "reportingYear" INTEGER NOT NULL,
    "openedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DischargeFacility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DischargePoint" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "pointCode" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "process" TEXT NOT NULL,
    "sampleFrequency" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DischargePoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EffluentLimit" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "parameter" TEXT NOT NULL,
    "limitValue" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "averagingPeriod" TEXT NOT NULL,
    "ruleVersion" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EffluentLimit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EffluentSample" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "dischargePointId" TEXT NOT NULL,
    "sampledAt" TIMESTAMP(3) NOT NULL,
    "parameter" TEXT NOT NULL,
    "resultValue" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "laboratory" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EffluentSample_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FlowReading" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "dischargePointId" TEXT NOT NULL,
    "measuredAt" TIMESTAMP(3) NOT NULL,
    "flowM3" DOUBLE PRECISION NOT NULL,
    "instrument" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FlowReading_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LabCustody" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "dischargePointId" TEXT NOT NULL,
    "collectedAt" TIMESTAMP(3) NOT NULL,
    "transferredAt" TIMESTAMP(3) NOT NULL,
    "collector" TEXT NOT NULL,
    "laboratory" TEXT NOT NULL,
    "sealNumber" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabCustody_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PretreatmentAsset" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "equipment" TEXT NOT NULL,
    "serviceAt" TIMESTAMP(3) NOT NULL,
    "nextDueAt" TIMESTAMP(3) NOT NULL,
    "observations" TEXT NOT NULL,
    "contractor" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PretreatmentAsset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DischargeIncident" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "dischargePointId" TEXT NOT NULL,
    "startedAt" TIMESTAMP(3) NOT NULL,
    "eventText" TEXT NOT NULL,
    "response" TEXT NOT NULL,
    "noticeReceipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DischargeIncident_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DischargeReport" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "periodStart" TIMESTAMP(3) NOT NULL,
    "periodEnd" TIMESTAMP(3) NOT NULL,
    "preparer" TEXT NOT NULL,
    "findings" TEXT NOT NULL,
    "receipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DischargeReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "dischargeFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "DischargeFacility_createdAt_idx" ON "DischargeFacility"("createdAt");

-- CreateIndex
CREATE INDEX "DischargePoint_createdAt_idx" ON "DischargePoint"("createdAt");

-- CreateIndex
CREATE INDEX "DischargePoint_dischargeFacilityId_idx" ON "DischargePoint"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "EffluentLimit_createdAt_idx" ON "EffluentLimit"("createdAt");

-- CreateIndex
CREATE INDEX "EffluentLimit_dischargeFacilityId_idx" ON "EffluentLimit"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "EffluentSample_createdAt_idx" ON "EffluentSample"("createdAt");

-- CreateIndex
CREATE INDEX "EffluentSample_dischargeFacilityId_idx" ON "EffluentSample"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "FlowReading_createdAt_idx" ON "FlowReading"("createdAt");

-- CreateIndex
CREATE INDEX "FlowReading_dischargeFacilityId_idx" ON "FlowReading"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "LabCustody_createdAt_idx" ON "LabCustody"("createdAt");

-- CreateIndex
CREATE INDEX "LabCustody_dischargeFacilityId_idx" ON "LabCustody"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "PretreatmentAsset_createdAt_idx" ON "PretreatmentAsset"("createdAt");

-- CreateIndex
CREATE INDEX "PretreatmentAsset_dischargeFacilityId_idx" ON "PretreatmentAsset"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "DischargeIncident_createdAt_idx" ON "DischargeIncident"("createdAt");

-- CreateIndex
CREATE INDEX "DischargeIncident_dischargeFacilityId_idx" ON "DischargeIncident"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "DischargeReport_createdAt_idx" ON "DischargeReport"("createdAt");

-- CreateIndex
CREATE INDEX "DischargeReport_dischargeFacilityId_idx" ON "DischargeReport"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_dischargeFacilityId_idx" ON "OperationalTask"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_dischargeFacilityId_idx" ON "RuleVersion"("dischargeFacilityId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_dischargeFacilityId_idx" ON "DocumentRequirement"("dischargeFacilityId");

-- AddForeignKey
ALTER TABLE "DischargePoint" ADD CONSTRAINT "DischargePoint_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EffluentLimit" ADD CONSTRAINT "EffluentLimit_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EffluentSample" ADD CONSTRAINT "EffluentSample_dischargePointId_fkey" FOREIGN KEY ("dischargePointId") REFERENCES "DischargePoint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EffluentSample" ADD CONSTRAINT "EffluentSample_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FlowReading" ADD CONSTRAINT "FlowReading_dischargePointId_fkey" FOREIGN KEY ("dischargePointId") REFERENCES "DischargePoint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FlowReading" ADD CONSTRAINT "FlowReading_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabCustody" ADD CONSTRAINT "LabCustody_dischargePointId_fkey" FOREIGN KEY ("dischargePointId") REFERENCES "DischargePoint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabCustody" ADD CONSTRAINT "LabCustody_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PretreatmentAsset" ADD CONSTRAINT "PretreatmentAsset_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeIncident" ADD CONSTRAINT "DischargeIncident_dischargePointId_fkey" FOREIGN KEY ("dischargePointId") REFERENCES "DischargePoint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeIncident" ADD CONSTRAINT "DischargeIncident_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DischargeReport" ADD CONSTRAINT "DischargeReport_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_dischargeFacilityId_fkey" FOREIGN KEY ("dischargeFacilityId") REFERENCES "DischargeFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

