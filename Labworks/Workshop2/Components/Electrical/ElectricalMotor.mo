within Labworks.Workshop2.Components.Electrical;
model ElectricalMotor
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited motor
    annotation (Placement(transformation(extent={{-20,-24},{0,-4}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-8,32})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-76,-20},{-56,0}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=ratio)
    annotation (Placement(transformation(extent={{18,-24},{38,-4}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J)
    annotation (Placement(transformation(extent={{56,-24},{76,-4}})));
  Modelica.Blocks.Interfaces.RealInput v1
    "Voltage between pin p and n (= p.v - n.v) as input signal"
    annotation (Placement(transformation(extent={{-120,2},{-80,42}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1
                    "Flange of right shaft"
    annotation (Placement(transformation(extent={{86,-24},{106,-4}})));
  parameter Real ratio "Transmission ratio (flange_a.phi/flange_b.phi)"
    annotation (Dialog(group="Mechanical Parameter"));
  parameter Modelica.Units.SI.Inertia J "Moment of inertia"
    annotation (Dialog(group="Mechanical Parameter"));
equation
  connect(inertia.flange_a, idealGear.flange_b)
    annotation (Line(points={{56,-14},{38,-14}}, color={0,0,0}));
  connect(idealGear.flange_a, motor.flange)
    annotation (Line(points={{18,-14},{0,-14},{0,-14}}, color={0,0,0}));
  connect(signalVoltage.n, motor.pin_ap) annotation (Line(points={{-18,32},{6,
          32},{6,-4},{-4,-4}}, color={0,0,255}));
  connect(ground.p, signalVoltage.p)
    annotation (Line(points={{-66,0},{-66,32},{2,32}}, color={0,0,255}));
  connect(motor.pin_an, motor.pin_ep)
    annotation (Line(points={{-16,-4},{-20,-4},{-20,-8}}, color={0,0,255}));
  connect(motor.pin_en, signalVoltage.p) annotation (Line(points={{-20,-20},{
          -34,-20},{-34,32},{2,32}}, color={0,0,255}));
  connect(signalVoltage.v, v1) annotation (Line(points={{-8,20},{-8,14},{-74,14},
          {-74,22},{-100,22}}, color={0,0,127}));
  connect(inertia.flange_b, flange_b1)
    annotation (Line(points={{76,-14},{96,-14}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ElectricalMotor;
