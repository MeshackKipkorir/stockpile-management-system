class Movements {
  String? iCreated;
  String? iUpdated;
  String? authorizingOfficer;
  String? issuingOfficer;
  String? receivingOfficerId;
  String? requisitioningOfficerId;
  String? movementDate;
  String? description;
  String? documentReference;
  String? sourceLocationId;
  String? targetLocationId;
  String? responsiblePerson;
  String? movementId;

  Movements(
      {this.iCreated,
      this.iUpdated,
      this.authorizingOfficer,
      this.issuingOfficer,
      this.receivingOfficerId,
      this.requisitioningOfficerId,
      this.movementDate,
      this.description,
      this.documentReference,
      this.sourceLocationId,
      this.targetLocationId,
      this.responsiblePerson,
      this.movementId});

  Movements.fromJson(Map<String, dynamic> json) {
    iCreated = json['i_created'];
    iUpdated = json['i_updated'];
    authorizingOfficer = json['authorizing_officer'];
    issuingOfficer = json['issuing_officer'];
    receivingOfficerId = json['receiving_officer_id'];
    requisitioningOfficerId = json['requisitioning_officer_id'];
    movementDate = json['movement_date'];
    description = json['description'];
    documentReference = json['document_reference'];
    sourceLocationId = json['source_location_id'];
    targetLocationId = json['target_location_id'];
    responsiblePerson = json['responsible_person'];
    movementId = json['movement_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['i_created'] = iCreated;
    data['i_updated'] = iUpdated;
    data['authorizing_officer'] = authorizingOfficer;
    data['issuing_officer'] = issuingOfficer;
    data['receiving_officer_id'] = receivingOfficerId;
    data['requisitioning_officer_id'] = requisitioningOfficerId;
    data['movement_date'] = movementDate;
    data['description'] = description;
    data['document_reference'] = documentReference;
    data['source_location_id'] = sourceLocationId;
    data['target_location_id'] = targetLocationId;
    data['responsible_person'] = responsiblePerson;
    data['movement_id'] = movementId;
    return data;
  }
}
