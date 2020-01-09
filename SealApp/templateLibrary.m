//
//  templateLibrary.m
//  SealApp
//
//  Created by Charles Leclercq on 19/08/2016.
//  Copyright © 2016 Seal. All rights reserved.
//

#import "templateLibrary.h"

@implementation templateLibrary

@synthesize termsLibrary, scopesLibrary,timeLibrary,valueLibrary;

- (instancetype)init

{
    self = [super init];
    if (self) {
        
        termsLibrary = @[ @{
                              
                              
                              @"ID": @"1",
                              @"templateName":@"Custom",
                              @"Title"  : @"Custom item",
                              @"Description":@"Type in a custom term",
                              @"Variable":@" "
                              },
                          @{
                              @"ID": @"2",
                              @"templateName":@"Termination",
                              @"Title"  : @"Termination",
                              @"Description":@"In the event of termination of this assignment, ownership of all copyrights and the original artwork shall be retained by the Designer, and a cancellation fee for work completed, and expenses already incurred, shall be paid by the Client. Cancellation fee is based on the hours submitted, if the project is on an hourly basis or a percentage based on the time estimate for the entire job. A 100% cancellation fee is due once the project has been finished, whether delivered to the client or not. If the project is on an hourly basis and the project is canceled by the client, the client agrees to pay no less than 100% of the hours already billed for the project at the time of cancellation or 50% of the remaining hours that were expected to be completed on the project, whichever is greater.",
                              @"Variable":@" "
                              },
                          @{
                              @"ID": @"3",
                              @"templateName":@"Copyrights",
                              @"Title"  : @"Copyrights",
                             
                              @"Description":@"Upon completion of the Services and expressly conditioned upon full payment of all fees, costs and out-of- pocket expenses due, Designer assigns to Client all ownership rights, including any copyrights, in and to any artworks or designs comprising the works created by Designer for use by Client as a Trademark. Designer shall cooperate with Client and shall execute any additional documents reasonably requested by Client to evidence such assignment. Client shall have sole responsibility for ensuring that any proposed trademarks or Final Deliverables intended to be a Trademark are available for use in commerce and federal registration and do not otherwise infringe the rights of any third party. Client hereby indemnifies, saves and holds harmless Designer from any and all damages, liabilities, costs, losses or expenses arising out of any claim, demand, or action by any third party alleging any infringement arising out of Client s use and/or failure to obtain rights to use or use of the Trademark.",
                              @"Variable":@" "
                              },
                          @{
                              @"ID": @"4",
                              @"templateName":@"Confidentiality",
                              @"Title": @"Confidentiality",
                             @"Description":@"Each party acknowledges that in connection with this Agreement it may receive certain confidential or proprietary technical and business information and materials of the other party, including without limitation Preliminary Works ( Confidential Information ). Each party, its agents and employees shall hold and maintain in strict confidence all Confidential Information, shall not disclose Confidential Information to any third party, and shall not use any Confidential Information except as may be necessary to perform its obligations under the Proposal except as may be required by a court or governmental authority. Notwithstanding the foregoing, Confidential Information shall not include any information that is in the public domain or becomes publicly known through no fault of the receiving party, or is otherwise properly received from a third party without an obligation of confidentiality.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"5",
                              @"templateName":@"General changes paid by Client",
                              @"Title"  : @"General changes paid by Client",
                              @"Description":@"Client shall pay additional charges for changes requested by Client outside the work specified in this agreement. Unless otherwise provided in the Proposal, and except as otherwise provided for herein, Client shall pay additional charges for changes requested by Client which are outside the scope of the Services on a time and materials basis, at Designer s standard hourly rate specified in this agreement. Such charges shall be in addition to all other amounts payable under the Proposal, despite any maximum budget, contract price or final price identified therein. Designer may extend or modify any delivery schedule or deadlines in the Proposal and Deliverables as may be required by such Changes.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"6",
                              @"templateName":@"Substantive changes with new agreement only",
                              @"Title"  : @"Substantive changes with new agreement only",
                              @"Description":@"Parties shall write a new agreement if the scope of this agreement (deliverables) is altered more than 50% in time or value. If Client requests or instructs Changes that amount to a revision of at least 50% of the time required to produce the Deliverables, and or the value or scope of the Services, Designer shall be entitled to submit a new and separate Proposal to Client for written approval. Work shall not begin on the revised services until a fully signed revised Proposal and, if required, any additional retainer fees are received by Designer.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"7",
                              @"templateName":@"Responsibility",
                              @"Title"  : @"Responsibility",
                              @"Description":@"Client acknowledges that it shall be responsible for performing the following in a reasonable and timely manner: (a) coordination of any decision-making with parties other than the Designer; (b) provision of Client Content in a form suitable for reproduction or incorporation into the Deliverables without further preparation, unless otherwise expressly provided in the Proposal; and (c) final proofreading and in the event that Client has approved Deliverables but errors, such as, by way of example, not limitation, typographic errors or misspellings, remain in the finished product, Client shall incur the cost of correcting such errors.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"8",
                              @"templateName":@"Relationship: Independent Contractor",
                              @"Title"  : @"Relationship: Independent Contractor",
                              @"Description":@"Designer is an independent contractor, not an employee of Client or any company affiliated with Client. Designer shall provide the Services under the general direction of Client, but Designer shall determine, in Designer s sole discretion, the manner and means by which the Services are accomplished. This Agreement does not create a partnership or joint venture and neither party is authorized to act as agent or bind the other party except as expressly stated in this Agreement. Designer and the work product or Deliverables prepared by Designer shall not be deemed a work for hire as that term is defined under Copyright Law. All rights, if any, granted to Client are contractual in nature and are wholly defined by the express written agreement of the parties and the various terms and conditions of this Agreement.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"9",
                              @"templateName":@"Relationship: Third parties",
                              @"Title"  : @"Relationship: Third parties",
                              @"Description":@"Designer is an independent contractor, not an employee of Client or any company affiliated with Client. Designer shall provide the Services under the general direction of Client, but Designer shall determine, in Designer s sole discretion, the manner and means by which the Services are accomplished. This Agreement does not create a partnership or joint venture and neither party is authorized to act as agent or bind the other party except as expressly stated in this Agreement. Designer and the work product or Deliverables prepared by Designer shall not be deemed a work for hire as that term is defined under Copyright Law. All rights, if any, granted to Client are contractual in nature and are wholly defined by the express written agreement of the parties and the various terms and conditions of this Agreement.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"10",
                              @"templateName":@"Relationship: No Solicitation",
                              @"Title"  : @"Relationship: No Solicitation",
                              @"Description":@"Client agrees not to solicit, recruit, engage or otherwise employ or retain, on a full-time, part-time, consulting, work-for-hire or any other kind of basis, any Designer, employee or Design Agent of Designer, whether or not said person has been assigned to perform tasks under this Agreement. During the term of this Agreement, and for a period of six (6) months after expiration or termination of this Agreement, Client agrees not to solicit, recruit, engage or otherwise employ or retain, on a full-time, part-time, consulting, work-for-hire or any other kind of basis, any Designer, employee or Design Agent of Designer, whether or not said person has been assigned to perform tasks under this Agreement. In the event such employment, consultation or work-for-hire event occurs, Client agrees that Designer shall be entitled to an agency commission to be the greater of, either (a) 25 percent of said person s starting salary with Client, or (b) 25 percent of fees paid to said person if engaged by Client as an independent contractor. In the event of (a) above, payment of the commission will be due within 30 days of the employment starting date. In the event of (b) above, payment will be due at the end of any month during which the independent contractor performed services for Client. Designer, in the event of nonpayment and in connection with this section, shall be entitled to seek all remedies under law and equity.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"11",
                              @"templateName":@"Relationship: No Exclusivity",
                              @"Title"  : @"Relationship: No Exclusivity",
                              @"Description":@"The parties expressly acknowledge that this Agreement does not create an exclusive relationship between the parties. Client is free to engage others to perform services of the same or similar nature to those provided by Designer, and Designer shall be entitled to offer and provide design services to others, solicit other clients and otherwise advertise the services offered by Designer.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"12",
                              @"templateName":@"Warranty by client",
                              @"Title"  : @"Warranty by client",
                              @"Description":@"Client represents, warrants and covenants to Designer that a) Client owns all right, title, and interest in, or otherwise has full right and authority to permit the use of the Client Content, b) to the best of Client s knowledge, the Client Content does not infringe the rights of any third party, and use of the Client Content as well as any Trademarks in connection with the Project does not and will not violate the rights of any third parties, (c) Client shall comply with the terms and conditions of any licensing agreements which govern the use of Third Party Materials, and (d) Client shall comply with all laws and regulations as they relate to the Services and Deliverables.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"13",
                              @"templateName":@"Warranty by Designer",
                              @"Title"  : @"Warranty by Designer",
                              @"Description":@"(a) Designer hereby represents, warrants and covenants to Client that Designer will provide the Services identified in the Agreement in a professional and workmanlike manner and in accordance with all reasonable professional standards or such services. (b) Designer further represents, warrants and covenants to Client that (i) except for Third Party Materials and Client Content, the Final Deliverables shall be the original work of Designer and/or its independent contractors, (ii) in the event that the Final Deliverables include the work of independent contractors commissioned for the Project by Designer, Designer shall have secure agreements from such contractors granting all necessary rights, title, and interest in and to the Final Deliverables sufficient for Designer to grant the intellectual property rights provided in this Agreement, and (iii) to the best of Designer s knowledge, the Final Art provided by Designer and Designer s subcontractors does not infringe the rights of any party, and use of same in connection with the Project will not violate the rights of any third parties. In the event Client or third parties modify or otherwise use the Deliverables outside of the scope or for any purpose not identified in the Proposal or this Agreement or contrary to the terms and conditions noted herein, all representations and warranties of Designer shall be void. (c) Except for the express representations and warranties stated in this agreement, designer makes no warranties whatsoever, designer explicitly disclaims any other warranties of any kind, either express or implied, including but not limited to warranties of merchantability or fitness for a particular purpose or compliance with laws or government rules or regulations applicable to the project.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"14",
                              @"templateName":@"Compliance with laws",
                              @"Title"  : @"Compliance with laws",
                              @"Description":@"Designer shall use commercially reasonable efforts to ensure that all Final Deliverables shall be designed to comply with the known relevant rules and regulations. Client, upon acceptance of the Deliverables, shall be responsible for conformance with all laws relating to the transfer of software and technology.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"15",
                              @"templateName":@"Expenses covered by the Client",
                              @"Title"  : @"Expenses covered by the Client",
                              @"Description":@"Client shall pay Designer s expenses incurred in connection with this Agreement with written prior approval from the Client including incidental and out-of-pocket expenses including but not limited to costs for telephone calls, postage, shipping, overnight courier, service bureaus, typesetting, blueprints, models, presentation materials, photocopies, computer expenses, parking fees and tolls, and taxis at cost.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"16",
                              @"templateName":@"Additional costs covered by client",
                              @"Title"  : @"Additional costs covered by client",
                              @"Description":@"The Project pricing includes Designer s fee only. Any and all outside costs including, but not limited to, equipment rental, photographer s costs and fees, photography and/or artwork licenses, prototype production costs, talent fees, music licenses and online access or hosting fees, will be billed to Client unless specifically otherwise provided for in the Proposal.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"17",
                              @"templateName":@"Travel costs covered by client",
                              @"Title"  : @"Travel costs covered by client",
                              @"Description":@"Client shall reimburse all travel expenses including transportation, meals, and lodging costs.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"18",
                              @"templateName":@"Deficiencies",
                              @"Title"  : @"Deficiencies",
                              @"Description":@"Subject to the representations and warranties of Client in connection with Client Content, Designer represents and warrants that the Final Deliverables will be free from Deficiencies. For the purposes of this Agreement,   Deficiency  shall mean a failure to comply with the specifications set forth in the Proposal in any material respect, but shall not include any problems caused by Client Content, modifications, alterations or changes made to Final Deliverables by Client or any third party after delivery by Designer, or the interaction of Final Deliverables with third party applications such as Web browsers other than those specified in the Proposal. The parties acknowledge that Client s sole remedy and Designer s sole liability for a breach of this Section is the obligation of Designer to correct any Deficiency identified within the Warranty Period. In the event that a Deficiency is caused by Third Party Materials provided or specified by Designer, Designers sole obligation shall be to substitute alternative Third Party Materials.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"19",
                              @"templateName":@"Designer Tools",
                              @"Title"  : @"Designer Tools",
                              @"Description":@"Subject to the representations and warranties of the Client in connection with the materials supplied by Client, Designer represents and warrants that, to the best of Designer s knowledge, the Designer Tools do not knowingly infringe the rights of any third party, and use of same in connection with the Project will not knowingly violate the rights of any third parties except to the extent that such violations are caused by Client Content, or the modification of, or use of the Deliverables in combination with materials or equipment outside the scope of the applicable specifications, by Client or third parties.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"20",
                              @"templateName":@"Liability by Client",
                              @"Title"  : @"Liability by Client",
                              @"Description":@"Client agrees to indemnify, save and hold harmless Designer from any and all damages, liabilities, costs, losses or expenses arising out of any claim, demand, or action by a third party arising out of any breach of Client s responsibilities or obligations, representations or warranties under this Agreement. Under such circumstances Designer shall promptly notify Client in writing of any claim or suit; (a) Client has sole control of the defense and all related settlement negotiations; and (b) Designer provides Client with commercially reasonable assistance, information and authority necessary to perform Client s obligations under this section. Client will reimburse the reasonable out-of-pocket expenses incurred by Designer in providing such assistance.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"21",
                              @"templateName":@"Liability by Designer",
                              @"Title"  : @"Liability by Designer",
                              @"Description":@"Subject to the terms, conditions, express representations and warranties provided in this Agreement, Designer agrees to indemnify, save and hold harmless Client from any and all damages, liabilities, costs, losses or expenses arising out of any finding of fact which is inconsistent with Designer s representations and warranties made herein, except in the event any such claims, damages, liabilities, costs, losses or expenses arise directly as a result of gross negligence or misconduct of Client provided that  (a) Client promptly notifies Designer in writing of the claim; (b) Designer shall have sole control of the defense and all related settlement negotiations; and (c) Client shall provide Designer with the assistance, information and authority necessary to perform Designer s obligations under this section. Notwithstanding the foregoing, Designer shall have no obligation to defend or otherwise indemnify Client for any claim or adverse finding of fact arising out of or due to Client Content, any unauthorized content, improper or illegal use, or the failure to update or maintain any Deliverables provided by Designer.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"22",
                              @"templateName":@"Limitation of Liability",
                              @"Title"  : @"Limitation of Liability",
                              @"Description":@"The services and the work product of designer are sold  as is.  In all circumstances, the maximum liability of designer, its directors, officers, employees, design agents and affiliates ( Designer Parties ), to client for damages for any and all causes whatsoever, and client s maximum remedy, regardless of the form of action, whether in contract, tort or otherwise, shall be limited to the net profit of designer. In no event shall designer be liable for any lost data or content, lost profits, business interruption or for any indirect, incidental, special, consequential, exemplary or punitive damages arising out of or relating to the materials or the services provided by designer, even if designer has been advised of the possibility of such damages, and notwithstanding the failure of essential purpose of any limited remedy.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"23",
                              @"templateName":@"Notices",
                              @"Title"  : @"Notices",
                              @"Description":@"All notices to be given hereunder shall be transmitted in writing either by facsimile or electronic mail with return confirmation of receipt or by certified or registered mail, return receipt requested, and shall be sent to the addresses identified below, unless notification of change of address is given in writing. Notice shall be effective upon receipt or in the case of fax or email, upon confirmation of receipt.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"24",
                              @"templateName":@"No Assignment",
                              @"Title"  : @"No Assignment",
                              @"Description":@"Neither party may assign, whether in writing or orally, or encumber its rights or obligations under this Agreement or permit the same to be transferred, assigned or encumbered by operation of law or otherwise, without the prior written consent of the other party.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"25",
                              @"templateName":@"Force Majeure",
                              @"Title"  : @"Force Majeure",
                              @"Description":@"Designer shall not be deemed in breach of this Agreement if Designer is unable  to complete the Services or any portion thereof by reason of fire, earthquake, labor dispute, act of God or public enemy, death, illness or incapacity of Designer or any local, state, federal, national or international law, governmental order or regulation or any other event beyond Designer s control (collectively,   Force Majeure Event ). Upon occurrence of any Force Majeure Event, Designer shall give notice to Client of its inability to perform or of delay in completing the Services and shall propose revisions to the schedule for completion of the Services.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"26",
                              @"templateName":@"Governing Law",
                              @"Title"  : @"Governing Law",
                              @"Description":@"The formation, construction, performance and enforcement of this Agreement shall be in accordance with the laws of the country / State indicated here or elsewhere in this agreement without regard to its conflict of law provisions or the conflict of law provisions of any other jurisdiction.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"27",
                              @"templateName":@"Dispute Resolution by",
                              @"Title"  : @"Dispute Resolution by",
                              @"Description":@"In the event of a dispute arising out of this Agreement, the parties agree to attempt to resolve any dispute by negotiation between the parties. If they are unable to resolve the dispute, either party may commence mediation and/or binding arbitration through a third party indicated here, or other forum mutually agreed to by the parties. The prevailing party in any dispute resolved by binding arbitration or litigation shall be entitled to recover its attorneys  fees and costs. The parties hereby waive any jurisdictional or venue defences available to them and further consent to service of process by mail. Client acknowledges that Designer will have no adequate remedy at law in the event Client uses the deliverables in any way not permitted hereunder, and hereby agrees that Designer shall be entitled to equitable relief by way of temporary and permanent injunction, and such other and further relief at law or equity as any arbitrator or court of competent jurisdiction may deem just and proper, in addition to any and all other remedies provided for herein.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"28",
                              @"templateName":@"Modifications",
                              @"Title"  : @"Modifications",
                              @"Description":@"Modifications of the terms of this contract must be written and authorized by both parties, involving the implementation of a new version of the contract as a whole following standard procedures of documentation and approval.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"29",
                              @"templateName":@"Client Content",
                              @"Title"  : @"Client Content",
                              @"Description":@"Client Content, including all pre-existing Trademarks, shall remain the sole property of Client or its respective suppliers, and Client or its suppliers shall be the sole owner of all rights in connection therewith. Client hereby grants to Designer a nonexclusive, nontransferable license to use, reproduce, modify, display and publish the Client Content solely in connection with Designer s performance of the Services and limited promotional uses of the Deliverables as authorized in this Agreement.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"30",
                              @"templateName":@"Third Party Materials",
                              @"Title"  : @"Third Party Materials",
                              @"Description":@"All Third Party Materials are the exclusive property of their respective owners. Designer shall inform Client of all Third Party Materials that may be required to perform the Services or otherwise integrated into the Final Art. Under such circumstances Designer shall inform Client of any need to license, at Client s expense, and unless otherwise provided for by Client, Client shall obtain the license(s) necessary to permit Client s use of the Third Party Materials consistent with the usage rights granted herein. In the event Client fails to properly secure or otherwise arrange for any necessary licenses or instructs the use of Third Party Materials, Client hereby indemnifies, saves and holds harmless Designer from any and all damages, liabilities, costs, losses or expenses arising out of any claim, demand, or action by a third party arising out of Client s failure to obtain copyright, trademark, publicity, privacy, defamation or other releases or permissions with respect to materials included in the Final Art",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"31",
                              @"templateName":@"Preliminary Works",
                              @"Title"  : @"Preliminary Works",
                              @"Description":@"Designer retains all rights in and to all Preliminary Works. Client shall return all Preliminary Works to Designer within 30 days of completion of the Services and all rights in and to any Preliminary Works shall remain the exclusive property of Designer",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"32",
                              @"templateName":@"License for limited usage, no modification rights",
                              @"Title"  : @"License for limited usage, no modification rights",
                              @"Description":@"Upon completion of the Services, and expressly subject to full payment of all fees, costs and out-of-pocket expenses due, Designer grants to Client the rights in the Final Art as set forth below. Any additional uses not identified herein require an additional license and may require an additional fee. All other rights are expressly reserved by Designer. The rights granted to Client are for the usage of the Final Art in its original form only. Client may not crop, distort, manipulate, reconfigure, mimic, animate, create derivative works or extract portions or in any other manner, alter the Final Art. (Define the usage: e.g website, print campaign etc.)",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"33",
                              @"templateName":@"Exclusive license, with modification rights",
                              @"Title"  : @"Exclusive license, with modification rights",
                              @"Description":@"Designer hereby grants to Client the exclusive, perpetual and worldwide right and license to use, reproduce, adapt, modify and display the Final Art solely in connection with the Project as defined in the Proposal and in accordance with the terms and conditions of this Agreement.",
                              @"Variable":@"  "
                              },
                          @{
                              @"ID": @"34",
                              @"templateName":@"Exclusive license, no modification rights",
                              @"Title"  : @"Exclusive license, no modification rights",
                              @"Description":@"Designer hereby grants to Client the exclusive, perpetual and worldwide right and license to use, reproduce and display the Final Art solely in connection with the Project as defined in the Proposal and in accordance with the various terms and conditions of this Agreement. The rights granted to Client are for usage of the Final Art in its original form only. Client may not crop, distort, manipulate, reconfigure, mimic, animate, create derivative works or extract portions or in any other manner, alter the Final Art.",
                              @"Variable":@"  "    
                              },
                          @{
                              @"ID": @"35",
                              @"templateName":@"Liquidation for unlicensed use",
                              @"Title"  : @"Liquidation for unlicensed use",
                              @"Description":@"Client s use of the Final Art shall be limited to the usage rights granted herein for the Project only. Use of the Final Art, Deliverables or any derivative works thereof by Client at any other time or location, or for another project or outside the scope of the rights granted herein require an additional fee specified below. In the event of non-payment, Designer shall be entitled to pursue all remedies under law and equity.",
                              @"Variable":@"  "    
                              },
                          @{
                              @"ID": @"36",
                              @"templateName":@"Assignment",
                              @"Title"  : @"Assignment",
                              @"Description":@"Upon completion of the Services, and expressly subject to full payment of all fees, costs and expenses due, Designer hereby assigns to Client all right, title and interest, including without limitation copyright and other intellectual property rights, in and to the Final Art. Designer agrees to reasonably cooperate with Client and shall execute any additional documents reasonably necessary to evidence such assignment.",
                              @"Variable":@"  "    
                              },
                          @{
                              @"ID": @"37",
                              @"templateName":@"Print-specific Terms and Conditions, Samples",
                              @"Title"  : @"Print-specific Terms and Conditions, Samples",
                              @"Description":@"Client shall provide Designer with (insert number) of samples of each printed or published form of the Final Deliverables, for use in Designer s portfolio and other self promotional uses. Such samples shall be representative of the highest quality of the work produced.",
                              @"Variable":@"  "    
                              },
                          @{
                              @"ID": @"38",
                              @"templateName":@"Print-specific Terms and Conditions, Finished Work",
                              @"Title"  : @"Print-specific Terms and Conditions, Finished Work",
                              @"Description":@"The printed work, and the arrangement or brokering of the print services by Designer, shall be deemed in compliance with this Agreement if the final printed product is within the acceptable variations as to kind, quantity, and price in accordance with current or standard trade practices identified by the supplier of the print and print-related services. Whenever commercially reasonable and if available, Designer shall provide copies of the current or standard trade practices to Client. Notwithstanding, Designer shall have no responsibility or obligation to negotiate changes or amendments to the current or standard trade practices.",
                              @"Variable":@"  "    
                              },
                          @{
                              @"ID": @"39",
                              @"templateName":@"Interactive-specific Terms and Conditions, Warranty Period",
                              @"Title"  : @"Interactive-specific Terms and Conditions, Warranty Period",
                              @"Description":@"Support Services means commercially reasonable technical support and assistance to maintain and update the Deliverables, including correcting any errors or Deficiencies, but shall not include the development of enhancements to the Project or other services outside the scope of the Proposal. During the first (insert number) months following expiration of this Agreement (Warranty Period), if any, Designer shall provide up to (insert number) hours of Support Services at no additional cost to Client. Additional time shall be billed at Designer s regular hourly rate, then in effect upon the date of the request for additional support.",
                              @"Variable":@"  "    
                              },
                          @{
                              @"ID": @"40",
                              @"templateName":@"Interactive-specific Terms and Conditions, Maintenance Period",
                              @"Title"  : @"Interactive-specific Terms and Conditions, Maintenance Period",
                              @"Description":@"Upon expiration of the Warranty Period and at Client s option, Designer will provide Support Services for the following (insert number) months (the Maintenance Period) for a monthly fee of $ (insert number) OR Designer s hourly fees of (insert number) per hour. The parties may extend the Maintenance Period beyond one year upon mutual written agreement.",
                              @"Variable":@"  "    
                              },
                          @{
                              @"ID": @"41",
                              @"templateName":@"Enhancements during the Maintenance Period",
                              @"Title"  : @"Enhancements during the Maintenance Period",
                              @"Description":@"During the Maintenance Period, Client may request that Designer develop enhancements to the Deliverables, and Designer shall exercise commercially reasonable efforts to prioritize Designer s resources to create such enhancements. The parties understand that preexisting obligations to third parties existing on the date of the request for enhancements may delay the immediate execution of any such requested enhancements. Such enhancements shall be provided on a time and materials basis at Designer s then in effect price for such services.",
                              @"Variable":@"  "
    

    }
                        ];
        
        scopesLibrary = @[  @{
                                
                                @"ID": @"1",
                                @"templateName":@"Custom item",
                                @"Title"  : @"Custom item",
                                @"Description":@"Description",
                                @"Variable":@"0",
                                @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"2",
                                @"templateName":@"Graphic design",
                                @"Title"  : @"Graphic design",
                                @"Description":@"Paid by the hour",
                                @"Variable":@"0",
                                 @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"3",
                                @"templateName":@"Copywriting",
                                @"Title"  : @"Copywriting",
                                @"Description":@"Paid by the hour",
                                @"Variable":@"0",
                                 @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"4",
                                @"templateName":@"Web design",
                                @"Title"  : @"Web design",
                                @"Description":@"Specify the deliverables here",
                                @"Variable":@"0",
                                 @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"5",
                                @"templateName":@"Admin work: meetings, calls etc",
                                @"Title"  : @"Admin work: meetings, calls etc",
                                @"Description":@"Paid by the hour (estimate below)",
                                @"Variable":@"0",
                                 @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"6",
                                @"templateName":@"Landing page design",
                                @"Title"  : @"Landing page design",
                                @"Description":@"Graphic design for a web landing page. 3 initial designs, 1 finalised design with typography, colours, icons and graphic elements ready to be handed for a coder to build the page. Format: PSD",
                                @"Variable":@"12",
                                 @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"7",
                                @"templateName":@"Illustration",
                                @"Title"  : @"Illustration",
                                @"Description":@"Artwork with exclusive license, with modification rights",
                                @"Variable":@"8",
                                @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"8",
                                @"templateName":@"Brainstorming",
                                @"Title"  : @"Brainstorming",
                                @"Description":@"Brainstorming for the project. Deliverables as listed:",
                                @"Variable":@"0",
                                 @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"9",
                                @"templateName":@"Logo design",
                                @"Title"  : @"Logo design",
                                @"Description":@"Initial discovery phase, 3 drafts for the logo, 1 final design. Black and white and colour versions. Delivery format: png, jpg, pdf.",
                                @"Variable":@"0",
                                 @"Currency":@"Hours"
                                },
                            @{
                                @"ID": @"10",
                                @"templateName":@"Prototype",
                                @"Title"  : @"Prototype",
                                @"Description":@"Building a prototype according to specifications listed:",
                                @"Variable":@"0",
                                 @"Currency":@"Hours"
                                }


                           
                           
                           ];
        
        
        
        timeLibrary = @[
                        
                        @{
                            
                            @"ID": @"1",
                            @"templateName":@"Start date",
                            @"Title"  : @"Start date",
                            @"Description":@"Start date",
                            @"Variable":@" "
                            },
                        @{
                            @"ID": @"2",
                            @"templateName":@"Deadline",
                            @"Title"  : @"Deadline",
                            @"Description":@"Deadline",
                            @"Variable":@" "
                            },
                        @{
                            @"ID": @"3",
                            @"templateName":@"Milestone",
                            @"Title"  : @"Milestone",
                            @"Description":@"Milestone",
                            @"Variable":@" "
                            },
                        @{
                            @"ID": @"4",
                            @"templateName":@"End date",
                            @"Title"  : @"End date",
                            @"Description":@"End date",
                            @"Variable":@" "
                            
                            
                            
                            }
                        
                        
                        
                        
                            ];
        
        
        valueLibrary = @[  @{
                               
                               @"ID": @"1",
                               @"templateName":@"Total value",
                               @"Title"  : @"Total value",
                               @"Description":@"0",
                               @"Variable":@"0",
                               @"Currency":@"$"
                               },
                           @{
                               @"ID": @"2",
                               @"templateName":@"Payment upfront",
                               @"Title"  : @"Payment upfront",
                               @"Description":@"0",
                               @"Variable":@"0",
                               @"Currency":@"%"
                               },
                           @{
                               @"ID": @"3",
                               @"templateName":@"Interest rate on late payments",
                               @"Title"  : @"Interest rate on late payments",
                               @"Description":@"1,5",
                               @"Variable":@"1,5",
                               @"Currency":@"%"
                               },
                           @{
                               @"ID": @"4",
                               @"templateName":@"Term of payment",
                               @"Title"  : @"Term of payment",
                               @"Description":@"0",
                               @"Variable":@"0",
                               @"Currency":@"Days"
                               }
                           
                               
                           
                            
                            
                            
                            
                            ];
    }
    return self;
}


@end
