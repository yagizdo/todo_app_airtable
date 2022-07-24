class Todo {
  String? id;
  String? createdTime;
  Fields? fields;

  Todo({this.id, this.createdTime, this.fields});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdTime = json['createdTime'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdTime'] = createdTime;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    return data;
  }
}

class Fields {
  String? title;
  String? description;
  List<File>? file;

  Fields({this.title, this.description, this.file});

  Fields.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    if (json['file'] != null) {
      file = <File>[];
      json['file'].forEach((v) {
        file!.add(File.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    if (file != null) {
      data['file'] = file!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class File {
  String? id;
  int? width;
  int? height;
  String? url;
  String? filename;
  int? size;
  String? type;
  Thumbnails? thumbnails;

  File(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.filename,
      this.size,
      this.type,
      this.thumbnails});

  File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    filename = json['filename'];
    size = json['size'];
    type = json['type'];
    thumbnails = json['thumbnails'] != null
        ? Thumbnails.fromJson(json['thumbnails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    data['filename'] = filename;
    data['size'] = size;
    data['type'] = type;
    if (thumbnails != null) {
      data['thumbnails'] = thumbnails!.toJson();
    }
    return data;
  }
}

class Thumbnails {
  Small? small;
  Small? large;
  Small? full;

  Thumbnails({this.small, this.large, this.full});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
    large = json['large'] != null ? Small.fromJson(json['large']) : null;
    full = json['full'] != null ? Small.fromJson(json['full']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (small != null) {
      data['small'] = small!.toJson();
    }
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (full != null) {
      data['full'] = full!.toJson();
    }
    return data;
  }
}

class Small {
  String? url;
  int? width;
  int? height;

  Small({this.url, this.width, this.height});

  Small.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
