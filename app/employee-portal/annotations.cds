using MyService2 as ticket from '../../srv/service';

annotate ticket.ServiceRequests with @(

    UI.HeaderInfo             : {
        TypeName      : 'Service Request',
        TypeNamePlural: 'My Tickets',
        Title         : {
            $Type: 'UI.DataField',
            Value: TicketNumber
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Title
        },
        TypeImageUrl  : 'sap-icon://laptop'
    },

    UI.LineItem               : [
        {
            $Type: 'UI.DataField',
            Value: TicketNumber,
            Label: 'Ticket No'
        },
        {
            $Type: 'UI.DataField',
            Value: Title,
            Label: 'Title'
        },
        {
            $Type: 'UI.DataField',
            Value: RequestType,
            Label: 'Type'
        },
        {
            $Type       : 'UI.DataField',
            Value       : Priority,
            Label       : 'Priority',
            Criticality : (![Priority] = 'CRITICAL' ? 1 : ![Priority] = 'HIGH' ? 2 : ![Priority] = 'MEDIUM' ? 3 : ![Priority] = 'LOW' ? 5 : 0)
        },
        {
            $Type       : 'UI.DataField',
            Value       : Status,
            Label       : 'Status',
            Criticality : (![Status] = 'OPEN' ? 2 : ![Status] = 'IN_PROGRESS' ? 3 : ![Status] = 'ESCALATED' ? 1 : ![Status] = 'RESOLVED' ? 3 : ![Status] = 'CLOSED' ? 5 : 0)

        },
        {
            $Type: 'UI.DataField',
            Value: SLADeadline,
            Label: 'SLA Deadline'
        },
        {
            $Type: 'UI.DataField',
            Value: AssignedTeam,
            Label: 'Assigned Team'
        },
        {
            $Type: 'UI.DataField',
            Value: SLABreached,
            Label: 'SLA Breached'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MyService2.assignTicket',
            Label : 'Assign Ticket'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MyService2.resolveTicket',
            Label : 'Resolve Ticket'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MyService2.escalateTicket',
            Label : 'Escalate Ticket'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MyService2.getBreachedSLAs',
            Label : 'Check SLA Breaches'
        }
    ],

    UI.SelectionFields        : [
        Status,
        Priority,
        RequestType,
        Category,
        SLABreached
    ],
    UI.FieldGroup #RaiseTicket: {
        Label: 'Raise Service Request',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: RequestType,
                Label: 'Request Type'
            },
            {
                $Type: 'UI.DataField',
                Value: Title,
                Label: 'Title'
            },
            {
                $Type: 'UI.DataField',
                Value: Description,
                Label: 'Description'
            },
            {
                $Type: 'UI.DataField',
                Value: Category,
                Label: 'Category'
            },
            {
                $Type: 'UI.DataField',
                Value: SubCategory,
                Label: 'Sub Category'
            },
            {
                $Type: 'UI.DataField',
                Value: Priority,
                Label: 'Priority'
            },
            {
                $Type: 'UI.DataField',
                Value: Impact,
                Label: 'Impact'
            },
            {
                $Type: 'UI.DataField',
                Value: Urgency,
                Label: 'Urgency'
            },
            {
                $Type: 'UI.DataField',
                Value: SourceChannel,
                Label: 'Source'
            },
            {
                $Type: 'UI.DataField',
                Value: IsVIPUser,
                Label: 'VIP User'
            }
        ]
    },

    UI.FieldGroup #StatusSLA  : {
        Label: 'Status & SLA',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Status,
                Label: 'Status'
            },
            {
                $Type: 'UI.DataField',
                Value: AssignedTeam,
                Label: 'Assigned Team'
            },
            {
                $Type: 'UI.DataField',
                Value: SLADeadline,
                Label: 'SLA Deadline'
            },
            {
                $Type: 'UI.DataField',
                Value: ResponseDue,
                Label: 'Response Due'
            },
            {
                $Type: 'UI.DataField',
                Value: FirstResponseAt,
                Label: 'First Response'
            },
            {
                $Type: 'UI.DataField',
                Value: SLABreached,
                Label: 'SLA Breached'
            },
            {
                $Type: 'UI.DataField',
                Value: EscalationLevel,
                Label: 'Escalation'
            },
            {
                $Type: 'UI.DataField',
                Value: EscalatedAt,
                Label: 'Escalated At'
            }
        ]
    },

    UI.FieldGroup #Resolution : {
        Label: 'Resolution Details',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ResolvedAt,
                Label: 'Resolved At'
            },
            {
                $Type: 'UI.DataField',
                Value: ResolutionSummary,
                Label: 'Resolution'
            },
            {
                $Type: 'UI.DataField',
                Value: RootCause,
                Label: 'Root Cause'
            },
            {
                $Type: 'UI.DataField',
                Value: WorkaroundProvided,
                Label: 'Workaround'
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target: '@UI.DataPoint#CustomerRating',
                Label : 'Your Rating',
            },
            {
                $Type: 'UI.DataField',
                Value: CustomerFeedback,
                Label: 'Your Feedback'
            }
        ]
    },
    UI.FieldGroup #Assets     : {
        Label: 'Assets',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: AssetTag,
                Label: 'Asset Tag'
            },
            {
                $Type: 'UI.DataField',
                Value: AssetName,
                Label: 'Asset Name'
            },
            {
                $Type: 'UI.DataField',
                Value: AssetType,
                Label: 'Type'
            },
            {
                $Type: 'UI.DataField',
                Value: Category,
                Label: 'Category'
            },
            {
                $Type: 'UI.DataField',
                Value: Brand,
                Label: 'Brand'
            },
            {
                $Type: 'UI.DataField',
                Value: Model,
                Label: 'Model'
            },
            {
                $Type: 'UI.DataField',
                Value: SerialNumber,
                Label: 'Serial No'
            },
            {
                $Type: 'UI.DataField',
                Value: AssetCondition,
                Label: 'Condition'
            },
            {
                $Type: 'UI.DataField',
                Value: Status,
                Label: 'Status'
            }
        ]
    },

    UI.Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Request Details',
            Target: '@UI.FieldGroup#RaiseTicket'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Status & SLA',
            Target: '@UI.FieldGroup#StatusSLA'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Resolution',
            Target: '@UI.FieldGroup#Resolution'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Comments',
            Target: 'Comments/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Assets',
            Target: '@UI.FieldGroup#Assets'
        }
    ]
);

annotate ticket.ServiceRequests with @(

UI.DataPoint #CustomerRating: {
    Title        : 'Customer Rating',
    Value        : CustomerRating,

    TargetValue  : 5,
    Visualization: #Rating
}

);

annotate ticket.Comments with @(
    UI.LineItem               : [
        {
            $Type: 'UI.DataField',
            Value: CommentText,
            Label: 'Comment'
        },
        {
            $Type: 'UI.DataField',
            Value: CommentType,
            Label: 'Type'
        },
        {
            $Type: 'UI.DataField',
            Value: IsInternal,
            Label: 'Internal'
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
            Label: 'Posted At'
        }
    ],
    UI.FieldGroup #CommentForm: {
        Label: 'Add Comment',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: CommentText,
                Label: 'Comment'
            },
            {
                $Type: 'UI.DataField',
                Value: CommentType,
                Label: 'Type'
            },
            {
                $Type: 'UI.DataField',
                Value: AttachmentURL,
                Label: 'Attachment'
            }
        ]
    }
);


annotate ticket.ServiceRequests with {
    TicketNumber       @readonly              @title: 'Ticket Number';
    Status             @readonly              @title: 'Status';
    SLADeadline        @readonly              @title: 'SLA Deadline';
    ResponseDue        @readonly              @title: 'Response Due';
    AssignedTeam       @readonly              @title: 'Assigned Team';
    SLABreached        @readonly              @title: 'SLA Breached';
    ResolvedAt         @readonly              @title: 'Resolved At';
    EscalationLevel    @readonly              @title: 'Escalation Level';
    EscalatedAt        @readonly              @title: 'Escalated At';
    FirstResponseAt    @readonly              @title: 'First Response At';
    ReopenedCount      @readonly              @title: 'Reopened Count';
    RequestType        @title: 'Request Type';
    Title              @title: 'Title';
    Description        @title: 'Description'  @UI.MultiLineText;
    Priority           @title: 'Priority';
    Category           @title: 'Category';
    SubCategory        @title: 'Sub Category';
    Impact             @title: 'Impact';
    Urgency            @title: 'Urgency';
    SourceChannel      @title: 'Source Channel';
    CustomerRating     @title: 'Rating (1-5)';
    CustomerFeedback   @title: 'Feedback'     @UI.MultiLineText;
    ResolutionSummary  @readonly              @title: 'Resolution'  @UI.MultiLineText;
    RootCause          @readonly              @title: 'Root Cause'  @UI.MultiLineText;
}


annotate ticket.ServiceRequests with {

    Status      @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'StatusVH',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: Status,
                ValueListProperty: 'Status'
            }]
        }
    );

    Priority    @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'PriorityVH',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: Priority,
                ValueListProperty: 'Priority'
            }]
        }
    );

    RequestType @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'RequestTypeVH',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: RequestType,
                ValueListProperty: 'RequestType'
            }]
        }
    );

    Category    @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'CategoryVH',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: Category,
                ValueListProperty: 'Category'
            }]
        }
    );

};
