package com.glass.entity.sensor;

import lombok.Data;

@Data
public class SensorBase {
      private Integer id;
      private Integer isDel;
      private String num;
      private String description;
      private Integer type;
}
