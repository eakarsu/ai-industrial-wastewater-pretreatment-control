export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-industrial-wastewater-pretreatment-control",
  "title": "Industrial Wastewater Pretreatment Control",
  "tagline": "Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories.",
    "entities": [
      "DischargeFacility",
      "DischargePoint",
      "EffluentLimit"
    ],
    "workflows": [
      "permit-limit-extraction",
      "sample-discrepancy-review"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories.",
    "entities": [
      "EffluentSample",
      "FlowReading",
      "LabCustody"
    ],
    "workflows": [
      "custody-completeness-check",
      "pretreatment-maintenance-summary"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories.",
    "entities": [
      "PretreatmentAsset",
      "DischargeIncident",
      "DischargeReport"
    ],
    "workflows": [
      "discharge-incident-narrative",
      "monitoring-report-draft"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "DischargeFacility": {
    "name": "DischargeFacility",
    "label": "Discharge Facility",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "permitNumber",
        "kind": "string"
      },
      {
        "name": "operator",
        "kind": "string"
      },
      {
        "name": "sewerAuthority",
        "kind": "string"
      },
      {
        "name": "address",
        "kind": "string"
      },
      {
        "name": "reportingYear",
        "kind": "number"
      },
      {
        "name": "openedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "DischargePoint": {
    "name": "DischargePoint",
    "label": "Discharge Point",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "pointCode",
        "kind": "string"
      },
      {
        "name": "location",
        "kind": "string"
      },
      {
        "name": "process",
        "kind": "string"
      },
      {
        "name": "sampleFrequency",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "EffluentLimit": {
    "name": "EffluentLimit",
    "label": "Effluent Limit",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "parameter",
        "kind": "string"
      },
      {
        "name": "limitValue",
        "kind": "number"
      },
      {
        "name": "unit",
        "kind": "string"
      },
      {
        "name": "averagingPeriod",
        "kind": "string"
      },
      {
        "name": "ruleVersion",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "EffluentSample": {
    "name": "EffluentSample",
    "label": "Effluent Sample",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "dischargePointId",
        "kind": "string"
      },
      {
        "name": "sampledAt",
        "kind": "date"
      },
      {
        "name": "parameter",
        "kind": "string"
      },
      {
        "name": "resultValue",
        "kind": "number"
      },
      {
        "name": "unit",
        "kind": "string"
      },
      {
        "name": "laboratory",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "FlowReading": {
    "name": "FlowReading",
    "label": "Flow Reading",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "dischargePointId",
        "kind": "string"
      },
      {
        "name": "measuredAt",
        "kind": "date"
      },
      {
        "name": "flowM3",
        "kind": "number"
      },
      {
        "name": "instrument",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "LabCustody": {
    "name": "LabCustody",
    "label": "Lab Custody",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "dischargePointId",
        "kind": "string"
      },
      {
        "name": "collectedAt",
        "kind": "date"
      },
      {
        "name": "transferredAt",
        "kind": "date"
      },
      {
        "name": "collector",
        "kind": "string"
      },
      {
        "name": "laboratory",
        "kind": "string"
      },
      {
        "name": "sealNumber",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "PretreatmentAsset": {
    "name": "PretreatmentAsset",
    "label": "Pretreatment Asset",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "equipment",
        "kind": "string"
      },
      {
        "name": "serviceAt",
        "kind": "date"
      },
      {
        "name": "nextDueAt",
        "kind": "date"
      },
      {
        "name": "observations",
        "kind": "string"
      },
      {
        "name": "contractor",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "DischargeIncident": {
    "name": "DischargeIncident",
    "label": "Discharge Incident",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "dischargePointId",
        "kind": "string"
      },
      {
        "name": "startedAt",
        "kind": "date"
      },
      {
        "name": "eventText",
        "kind": "string"
      },
      {
        "name": "response",
        "kind": "string"
      },
      {
        "name": "noticeReceipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "DischargeReport": {
    "name": "DischargeReport",
    "label": "Discharge Report",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "periodStart",
        "kind": "date"
      },
      {
        "name": "periodEnd",
        "kind": "date"
      },
      {
        "name": "preparer",
        "kind": "string"
      },
      {
        "name": "findings",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "dischargeFacilityId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "permit-limit-extraction",
    "title": "Permit limit extraction",
    "description": "Permit limit extraction using selected discharge facility records and supplied evidence.",
    "prompt": "Permit limit extraction for Industrial Wastewater Pretreatment Control. Operational scope: Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories. Specific AI scope: Extract laboratory reports and summarize exceedance evidence. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "sample-discrepancy-review",
    "title": "Sample discrepancy review",
    "description": "Sample discrepancy review using selected discharge facility records and supplied evidence.",
    "prompt": "Sample discrepancy review for Industrial Wastewater Pretreatment Control. Operational scope: Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories. Specific AI scope: Extract laboratory reports and summarize exceedance evidence. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "custody-completeness-check",
    "title": "Custody completeness check",
    "description": "Custody completeness check using selected discharge facility records and supplied evidence.",
    "prompt": "Custody completeness check for Industrial Wastewater Pretreatment Control. Operational scope: Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories. Specific AI scope: Extract laboratory reports and summarize exceedance evidence. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "pretreatment-maintenance-summary",
    "title": "Pretreatment maintenance summary",
    "description": "Pretreatment maintenance summary using selected discharge facility records and supplied evidence.",
    "prompt": "Pretreatment maintenance summary for Industrial Wastewater Pretreatment Control. Operational scope: Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories. Specific AI scope: Extract laboratory reports and summarize exceedance evidence. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "discharge-incident-narrative",
    "title": "Discharge incident narrative",
    "description": "Discharge incident narrative using selected discharge facility records and supplied evidence.",
    "prompt": "Discharge incident narrative for Industrial Wastewater Pretreatment Control. Operational scope: Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories. Specific AI scope: Extract laboratory reports and summarize exceedance evidence. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "monitoring-report-draft",
    "title": "Monitoring report draft",
    "description": "Monitoring report draft using selected discharge facility records and supplied evidence.",
    "prompt": "Monitoring report draft for Industrial Wastewater Pretreatment Control. Operational scope: Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories. Specific AI scope: Extract laboratory reports and summarize exceedance evidence. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected discharge facility records and supplied evidence.",
    "prompt": "Evidence completeness review for Industrial Wastewater Pretreatment Control. Operational scope: Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories. Specific AI scope: Extract laboratory reports and summarize exceedance evidence. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected discharge facility records and supplied evidence.",
    "prompt": "Operations handoff draft for Industrial Wastewater Pretreatment Control. Operational scope: Maintain industrial-user permits, sampling schedules, laboratory results, limit checks and enforcement case histories. Specific AI scope: Extract laboratory reports and summarize exceedance evidence. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
